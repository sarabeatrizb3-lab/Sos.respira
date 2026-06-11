# SOS Respira 🫁

Um aplicativo Flutter de suporte mental para ajudar adolescentes com técnicas de respiração, conversas com IA e recursos de emergência.

## 🎯 Funcionalidades

- **Seleção de Humor**: Escolha como você está se sentindo (Ótimo, Bom, Neutro, Triste, Péssimo)
- **Chat com IA**: Converse com um assistente de inteligência artificial para suporte emocional
- **Exercício de Respiração**: Técnica de respiração 4-7-8 para aliviar ansiedade
- **Botão de Emergência**: Acesso rápido a recursos de ajuda e números de emergência
- **Interface Amigável**: Design intuitivo pensado para adolescentes

## 📱 Telas

### Home Screen
- Seleção de humor com emojis
- Acesso rápido aos exercícios e chat
- Botão de emergência destacado

### Chat Screen
- Interface de conversa em tempo real
- Respostas simuladas de IA (pronto para integração real)
- Histórico de mensagens
- Indicador de digitação

### Breathing Screen
- Exercício visual de respiração guiada
- Animação que ajuda a acompanhar o ritmo
- Contador de ciclos respiratórios

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK instalado
- Dart SDK (incluído no Flutter)
- Android Studio ou Xcode (para emulador)

### Instalação

```bash
# Clone o repositório
git clone https://github.com/sarabeatrizb3-lab/sos.respira.git

# Entre no diretório
cd sos.respira

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```

## 📦 Dependências

- **provider**: Gerenciamento de estado
- **intl**: Formatação de datas e internacionalização

## 🎨 Tema

O app utiliza um sistema de cores consistente:
- **Azul Primário**: #2196F3
- **Verde de Sucesso**: #4CAF50
- **Laranja de Aviso**: #FFC107
- **Vermelho de Erro**: #F44336

## 🔧 Estrutura do Projeto

```
lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   ├── chat_screen.dart
│   └── breathing_screen.dart
├── widgets/
│   ├── mood_button.dart
│   └── message_bubble.dart
├── models/
│   ├── mood_model.dart
│   └── message_model.dart
└── theme/
    └── app_theme.dart
```

## 🔮 Próximas Melhorias

- [ ] Integração com API de IA real
- [ ] Persistência de dados local com SQLite
- [ ] Notificações push de check-in
- [ ] Histórico de humor com gráficos
- [ ] Dicas de bem-estar personalizadas
- [ ] Modo escuro

## 📞 Recursos de Emergência

- **CVV (Centro de Valorização da Vida)**: 188
- **Polícia**: 190
- **SAMU**: 192

## 👥 Autores

- Sara Beatriz Belo da Silva Santos
- Esdras Ladyson Nascimento Barbosa

## 📄 Licença

Este projeto está sob licença MIT.

---

**Desenvolvido com ❤️ para promover saúde mental**