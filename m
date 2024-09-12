Return-Path: <linux-i2c+bounces-6649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB09770A1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65EC61F27F49
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE4B1C3304;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJ9QlbYb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816B1C2DC9;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=AW7cXJl2k4mdiIl/tnJNYfQlPwXvgfQWoevvlixUEW3ijvrL1H+5KVYLwr/7F+YplQrypH4hvihx2U6SL4VB1v3ficwzx6uTQkZ8+pMEUaVIq5mFPJN0Y6GxQu8J3cFphFrOKjewLSRZT7q4hd6GbRyQjKr+sKqqqIioFCeSGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=08rrGrrtrIaYM4CMpLN0nNY+AYSy4V4IJi7+yk9IBFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjdMf0DuXKMueJJLGGOYL4ABZFc3LAc2IEJtA4BbpHKQFaKp/jkIqdeupEZZ9fevmg3WVR5u7+CRBqVoGSyy5pV/I/ogHUQx45c/a/qmh9LY/8E2k3rhrBs3hVxcaezR0uUJOcVo/kECyArn48DvRtGGohnNCtfwseXJbQaLbJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJ9QlbYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C727C4FDF1;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=08rrGrrtrIaYM4CMpLN0nNY+AYSy4V4IJi7+yk9IBFw=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=fJ9QlbYbHRLnMHPULtEOJ0e2dyh8bCG1lLkgzCKHvx2+4ItG+e5GwqSvK0gGC6Dvz
	 MWV9l6ZJnTiM97tOQNE4x+yvbE5jgAZIDZMb+7n2Jbm5kWSIQeemelT8/CyzL8odhU
	 mlM82PnoyR5Ua7aNXSpDZFUeDoPLcjAmhLW1+XYSCpeg5u+4nJ4fN5h3Hp3ZxJ160c
	 C4JvkWQer15nFtFsmjj9pqcWgscSOj6/YdvoOsKyH8m8so5PKB3z/6A0ty4459gqha
	 ADwgCQh5GXdefElXCaNe9Ubm2rtKmELuXegZWbCgrjqVpiYuJ5RWUzEcKdRORoxqaY
	 NzDxUcFsGLWUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515D9EEE262;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:02 +0100
Subject: [PATCH 17/21] serial: adi,uart: Add driver for ADI ADSP-SC5xx
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-17-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=33930;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=DvfU37hVhNRYyO5LsqnmjnpDiC1h7qtXUog11TyP7jU=;
 b=0KuNbaB56olmWmG84P2NmiyQHkuKcGe6oUbE6QlhJ6tbw60h0Ep2p2GQW6yt33YyWU77NGXeL
 UFpsqgEJ09RAZ0Stfq1t/07WCFGtWNpHsTAJ3zAg+gmy3x+Mvqc83Ns
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Adding UART driver,supports all ADSP-SC5xx SoC family
- Support FIFO mode
- Support earlyprintk
- Support Enable Divide By One support, for higher clock resolutions.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/tty/serial/Kconfig       |   19 +-
 drivers/tty/serial/Makefile      |    1 +
 drivers/tty/serial/adi_uart.c    | 1045 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/serial_core.h |    3 +
 4 files changed, 1067 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 28e4beeabf8f373fc76e09ea7d1c9d55a66f4964..1d1d8fc808969c721d5931127d9294fb17d9c249 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -471,6 +471,23 @@ config SERIAL_SA1100_CONSOLE
 	  your boot loader (lilo or loadlin) about how to pass options to the
 	  kernel at boot time.)
 
+config SERIAL_ADI_UART
+	tristate "ADI uart serial port support"
+	depends on ARCH_SC59X = y || ARCH_SC59X_64 = y
+	select SERIAL_CORE
+	select SERIAL_CORE_CONSOLE
+	help
+	  Add support for the built-in adi uart driver.
+
+config SERIAL_ADI_UART_CONSOLE
+	bool "Console on ADI uart serial port"
+	depends on SERIAL_ADI_UART
+	default y
+	select SERIAL_CORE_CONSOLE
+	help
+	  If you have enabled the ADI UART serial port, you can
+	  make it the console by answering Y to this option.
+
 config SERIAL_IMX
 	tristate "IMX serial port support"
 	depends on ARCH_MXC || COMPILE_TEST
@@ -771,7 +788,7 @@ config SERIAL_CPM
 	depends on CPM2 || CPM1
 	select SERIAL_CORE
 	help
-	  This driver supports the SCC and SMC serial ports on Motorola 
+	  This driver supports the SCC and SMC serial ports on Motorola
 	  embedded PowerPC that contain a CPM1 (8xx) or CPM2 (8xxx)
 
 config SERIAL_CPM_CONSOLE
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index 6ff74f0a9530c4f6e058a848f74084f3b63a730a..9d4920b51b55af70c285d9bcaef53cc01a69b898 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_SERIAL_JSM)		+= jsm/
 obj-$(CONFIG_SERIAL_LANTIQ)		+= lantiq.o
 obj-$(CONFIG_SERIAL_LITEUART)		+= liteuart.o
 obj-$(CONFIG_SERIAL_HS_LPC32XX)		+= lpc32xx_hs.o
+obj-$(CONFIG_SERIAL_ADI_UART)		+= adi_uart.o
 obj-$(CONFIG_SERIAL_MAX3100)		+= max3100.o
 obj-$(CONFIG_SERIAL_MAX310X)		+= max310x.o
 obj-$(CONFIG_SERIAL_MCF)		+= mcf.o
diff --git a/drivers/tty/serial/adi_uart.c b/drivers/tty/serial/adi_uart.c
new file mode 100644
index 0000000000000000000000000000000000000000..dfbc7dcfd6169a299d4b1580e56f5ba0a3d8cc12
--- /dev/null
+++ b/drivers/tty/serial/adi_uart.c
@@ -0,0 +1,1045 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADI On-Chip Two Wire Interface Driver
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#include <linux/circ_buf.h>
+#include <linux/clk.h>
+#include <linux/dmaengine.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/serial_core.h>
+#include <linux/tty_flip.h>
+
+#if defined(CONFIG_SERIAL_ADI_UART_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
+#define SUPPORT_SYSRQ
+#endif
+
+#define DRIVER_NAME "adi-uart"
+
+struct adi_uart_serial_port {
+	struct uart_port port;
+	struct device *dev;
+	unsigned int old_status;
+	int tx_irq;
+	int rx_irq;
+	int status_irq;
+	unsigned int lsr;
+	unsigned int hwflow_mode;
+	struct gpio_desc *hwflow_en_pin;
+	bool hwflow_en;
+	/* Use enable-divide-by-one in divisor? */
+	bool edbo;
+	struct clk *clk;
+};
+
+#define ADI_UART_NO_HWFLOW	0
+#define ADI_UART_HWFLOW_PERI	1
+
+#define ADI_UART_NR_PORTS 4
+static struct adi_uart_serial_port *adi_uart_serial_ports[ADI_UART_NR_PORTS];
+
+/* UART_CTL Masks */
+#define UCEN                     0x1  /* Enable UARTx Clocks */
+#define LOOP_ENA                 0x2  /* Loopback Mode Enable */
+#define UMOD_MDB                 0x10  /* Enable MDB Mode */
+#define UMOD_IRDA                0x20  /* Enable IrDA Mode */
+#define UMOD_MASK                0x30  /* Uart Mode Mask */
+#define WLS(x)                   (((x-5) & 0x03) << 8)  /* Word Length Select */
+#define WLS_MASK                 0x300  /* Word length Select Mask */
+#define WLS_OFFSET               8      /* Word length Select Offset */
+#define STB                      0x1000  /* Stop Bits */
+#define STBH                     0x2000  /* Half Stop Bits */
+#define PEN                      0x4000  /* Parity Enable */
+#define EPS                      0x8000  /* Even Parity Select */
+#define STP                      0x10000  /* Stick Parity */
+#define FPE                      0x20000  /* Force Parity Error On Transmit */
+#define FFE                      0x40000  /* Force Framing Error On Transmit */
+#define SB                       0x80000  /* Set Break */
+#define LCR_MASK		 (SB | STP | EPS | PEN | STB | WLS_MASK)
+#define FCPOL                    0x400000  /* Flow Control Pin Polarity */
+#define RPOLC                    0x800000  /* IrDA RX Polarity Change */
+#define TPOLC                    0x1000000  /* IrDA TX Polarity Change */
+#define MRTS                     0x2000000  /* Manual Request To Send */
+#define XOFF                     0x4000000  /* Transmitter Off */
+#define ARTS                     0x8000000  /* Automatic Request To Send */
+#define ACTS                     0x10000000  /* Automatic Clear To Send */
+#define RFIT                     0x20000000  /* Receive FIFO IRQ Threshold */
+#define RFRT                     0x40000000  /* Receive FIFO RTS Threshold */
+
+/* UART_STAT Masks */
+#define DR                       0x01  /* Data Ready */
+#define OE                       0x02  /* Overrun Error */
+#define PE                       0x04  /* Parity Error */
+#define FE                       0x08  /* Framing Error */
+#define BI                       0x10  /* Break Interrupt */
+#define THRE                     0x20  /* THR Empty */
+#define TEMT                     0x80  /* TSR and UART_THR Empty */
+#define TFI                      0x100  /* Transmission Finished Indicator */
+
+#define ASTKY                    0x200  /* Address Sticky */
+#define ADDR                     0x400  /* Address bit status */
+#define RO			 0x800  /* Reception Ongoing */
+#define SCTS                     0x1000  /* Sticky CTS */
+#define CTS                      0x10000  /* Clear To Send */
+#define RFCS                     0x20000  /* Receive FIFO Count Status */
+
+/* UART_CLOCK Masks */
+#define EDBO                     0x80000000 /* Enable Devide by One */
+
+/* UART_IER Masks */
+#define ERBFI                    0x01  /* Enable Receive Buffer Full Interrupt */
+#define ETBEI                    0x02  /* Enable Transmit Buffer Empty Interrupt */
+#define ELSI                     0x04  /* Enable RX Status Interrupt */
+#define EDSSI                    0x08  /* Enable Modem Status Interrupt */
+#define EDTPTI                   0x10  /* Enable DMA Transmit PIRQ Interrupt */
+#define ETFI                     0x20  /* Enable Transmission Finished Interrupt */
+#define ERFCI                    0x40  /* Enable Receive FIFO Count Interrupt */
+
+# define OFFSET_REDIV            0x00  /* Version ID Register             */
+# define OFFSET_CTL              0x04  /* Control Register                */
+# define OFFSET_STAT             0x08  /* Status Register                 */
+# define OFFSET_SCR              0x0C  /* SCR Scratch Register            */
+# define OFFSET_CLK              0x10  /* Clock Rate Register             */
+# define OFFSET_IER              0x14  /* Interrupt Enable Register       */
+# define OFFSET_IER_SET          0x18  /* Set Interrupt Enable Register   */
+# define OFFSET_IER_CLEAR        0x1C  /* Clear Interrupt Enable Register */
+# define OFFSET_RBR              0x20  /* Receive Buffer register         */
+# define OFFSET_THR              0x24  /* Transmit Holding register       */
+
+#define UART_GET_CHAR(p)      readl(p->port.membase + OFFSET_RBR)
+#define UART_GET_CLK(p)       readl(p->port.membase + OFFSET_CLK)
+#define UART_GET_CTL(p)       readl(p->port.membase + OFFSET_CTL)
+#define UART_GET_GCTL(p)      UART_GET_CTL(p)
+#define UART_GET_LCR(p)       UART_GET_CTL(p)
+#define UART_GET_MCR(p)       UART_GET_CTL(p)
+#define UART_GET_STAT(p)      readl(p->port.membase + OFFSET_STAT)
+#define UART_GET_MSR(p)       UART_GET_STAT(p)
+
+#define UART_PUT_CHAR(p, v)   writel(v, p->port.membase + OFFSET_THR)
+#define UART_PUT_CLK(p, v)    writel(v, p->port.membase + OFFSET_CLK)
+#define UART_PUT_CTL(p, v)    writel(v, p->port.membase + OFFSET_CTL)
+#define UART_PUT_GCTL(p, v)   UART_PUT_CTL(p, v)
+#define UART_PUT_LCR(p, v)    UART_PUT_CTL(p, v)
+#define UART_PUT_MCR(p, v)    UART_PUT_CTL(p, v)
+#define UART_PUT_STAT(p, v)   writel(v, p->port.membase + OFFSET_STAT)
+
+#define UART_CLEAR_IER(p, v)  writel(v, p->port.membase + OFFSET_IER_CLEAR)
+#define UART_GET_IER(p)       readl(p->port.membase + OFFSET_IER)
+#define UART_SET_IER(p, v)    writel(v, p->port.membase + OFFSET_IER_SET)
+
+#define UART_CLEAR_LSR(p)     UART_PUT_STAT(p, -1)
+#define UART_GET_LSR(p)       UART_GET_STAT(p)
+#define UART_PUT_LSR(p, v)    UART_PUT_STAT(p, v)
+
+/* This handles hard CTS/RTS */
+#define UART_CLEAR_SCTS(p)      UART_PUT_STAT(p, SCTS)
+#define UART_GET_CTS(x)         (UART_GET_MSR(x) & CTS)
+#define UART_DISABLE_RTS(x)     UART_PUT_MCR(x, UART_GET_MCR(x) & ~(ARTS | MRTS))
+#define UART_ENABLE_RTS(x)      UART_PUT_MCR(x, UART_GET_MCR(x) | MRTS | ARTS)
+#define UART_ENABLE_INTS(x, v)  UART_SET_IER(x, v)
+#define UART_DISABLE_INTS(x)    UART_CLEAR_IER(x, 0xF)
+
+#define DMA_RX_XCOUNT		512
+#define DMA_RX_YCOUNT		(PAGE_SIZE / DMA_RX_XCOUNT)
+
+#define DMA_RX_FLUSH_JIFFIES	(msecs_to_jiffies(50))
+
+
+static void adi_uart_serial_tx_chars(struct adi_uart_serial_port *uart);
+static void adi_uart_serial_reset_irda(struct uart_port *port);
+
+
+static struct adi_uart_serial_port *to_adi_serial_port(struct uart_port *port)
+{
+	return container_of(port, struct adi_uart_serial_port, port);
+}
+
+static unsigned int adi_uart_serial_get_mctrl(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	if (!uart->hwflow_mode || !uart->hwflow_en)
+		return TIOCM_CTS | TIOCM_DSR | TIOCM_CAR;
+
+	/* CTS PIN is negative assertive. */
+	if (UART_GET_CTS(uart))
+		return TIOCM_CTS | TIOCM_DSR | TIOCM_CAR;
+	else
+		return TIOCM_DSR | TIOCM_CAR;
+}
+
+static void adi_uart_serial_set_mctrl(struct uart_port *port,
+		unsigned int mctrl)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	if (!uart->hwflow_mode || !uart->hwflow_en)
+		return;
+
+	/* RTS PIN is negative assertive. */
+	if (mctrl & TIOCM_RTS)
+		UART_ENABLE_RTS(uart);
+	else
+		UART_DISABLE_RTS(uart);
+}
+
+/*
+ * Handle any change of modem status signal.
+ */
+static irqreturn_t adi_uart_serial_mctrl_cts_int(int irq, void *dev_id)
+{
+	struct adi_uart_serial_port *uart = dev_id;
+	unsigned int status = adi_uart_serial_get_mctrl(&uart->port);
+	struct tty_struct *tty = uart->port.state->port.tty;
+
+	if (uart->hwflow_mode == ADI_UART_HWFLOW_PERI) {
+		UART_CLEAR_SCTS(uart);
+		if (tty->hw_stopped) {
+			if (status) {
+				tty->hw_stopped = 0;
+				uart_write_wakeup(&uart->port);
+			}
+		} else {
+			if (!status)
+				tty->hw_stopped = 1;
+		}
+	}
+
+	uart_handle_cts_change(&uart->port, status & TIOCM_CTS);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * interrupts are disabled on entry
+ */
+static void adi_uart_serial_stop_tx(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	while (!(UART_GET_LSR(uart) & TEMT))
+		cpu_relax();
+
+	UART_PUT_LSR(uart, TFI);
+	UART_CLEAR_IER(uart, ETBEI);
+}
+
+/*
+ * port is locked and interrupts are disabled
+ */
+static void adi_uart_serial_start_tx(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	struct tty_struct *tty = uart->port.state->port.tty;
+
+	/*
+	 * To avoid losting RX interrupt, we reset IR function
+	 * before sending data.
+	 */
+	if (tty->termios.c_line == N_IRDA)
+		adi_uart_serial_reset_irda(port);
+
+	UART_SET_IER(uart, ETBEI);
+	adi_uart_serial_tx_chars(uart);
+}
+
+/*
+ * Interrupts are enabled
+ */
+static void adi_uart_serial_stop_rx(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	UART_CLEAR_IER(uart, ERBFI);
+}
+
+/*
+ * Set the modem control timer to fire immediately.
+ */
+static void adi_uart_serial_enable_ms(struct uart_port *port)
+{
+}
+
+static void adi_uart_serial_rx_chars(struct adi_uart_serial_port *uart)
+{
+	unsigned int status, ch, flg;
+
+	status = UART_GET_LSR(uart);
+	UART_CLEAR_LSR(uart);
+
+	ch = UART_GET_CHAR(uart);
+	uart->port.icount.rx++;
+
+	if (status & BI) {
+		uart->port.icount.brk++;
+		if (uart_handle_break(&uart->port))
+			goto ignore_char;
+		status &= ~(PE | FE);
+	}
+	if (status & PE)
+		uart->port.icount.parity++;
+	if (status & OE)
+		uart->port.icount.overrun++;
+	if (status & FE)
+		uart->port.icount.frame++;
+
+	status &= uart->port.read_status_mask;
+
+	if (status & BI)
+		flg = TTY_BREAK;
+	else if (status & PE)
+		flg = TTY_PARITY;
+	else if (status & FE)
+		flg = TTY_FRAME;
+	else
+		flg = TTY_NORMAL;
+
+	if (uart_handle_sysrq_char(&uart->port, ch))
+		goto ignore_char;
+
+	uart_insert_char(&uart->port, status, OE, ch, flg);
+
+ ignore_char:
+	tty_flip_buffer_push(&uart->port.state->port);
+}
+
+static void adi_uart_serial_tx_chars(struct adi_uart_serial_port *uart)
+{
+	struct tty_port *tport = &uart->port.state->port;
+	unsigned char c;
+
+	if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(&uart->port)) {
+		/* Clear TFI bit */
+		UART_PUT_LSR(uart, TFI);
+		/* Anomaly notes:
+		 *  05000215 -	we always clear ETBEI within last UART TX
+		 *		interrupt to end a string. It is always set
+		 *		when start a new tx.
+		 */
+		UART_CLEAR_IER(uart, ETBEI);
+		return;
+	}
+
+	if (uart->port.x_char) {
+		UART_PUT_CHAR(uart, uart->port.x_char);
+		uart->port.icount.tx++;
+		uart->port.x_char = 0;
+	}
+
+	if (UART_GET_LSR(uart) & THRE) {
+		/* pop data from fifo */
+		if (kfifo_get(&tport->xmit_fifo, &c)) {
+			UART_PUT_CHAR(uart, c);
+			uart->port.icount.tx++;
+		}
+	}
+
+	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(&uart->port);
+}
+
+static irqreturn_t adi_uart_serial_rx_int(int irq, void *dev_id)
+{
+	struct adi_uart_serial_port *uart = dev_id;
+
+	while (UART_GET_LSR(uart) & DR)
+		adi_uart_serial_rx_chars(uart);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t adi_uart_serial_tx_int(int irq, void *dev_id)
+{
+	struct adi_uart_serial_port *uart = dev_id;
+
+	spin_lock(&uart->port.lock);
+	if (UART_GET_LSR(uart) & THRE)
+		adi_uart_serial_tx_chars(uart);
+	spin_unlock(&uart->port.lock);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * Return TIOCSER_TEMT when transmitter is not busy.
+ */
+static unsigned int adi_uart_serial_tx_empty(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	unsigned int lsr;
+
+	lsr = UART_GET_LSR(uart);
+	if (lsr & TEMT)
+		return TIOCSER_TEMT;
+	else
+		return 0;
+}
+
+static void adi_uart_serial_break_ctl(struct uart_port *port, int break_state)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	u32 lcr = UART_GET_LCR(uart);
+
+	if (break_state)
+		lcr |= SB;
+	else
+		lcr &= ~SB;
+	UART_PUT_LCR(uart, lcr);
+}
+
+static int adi_uart_serial_startup(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	int ret;
+
+	ret = clk_prepare_enable(uart->clk);
+	if (ret)
+		return ret;
+
+	if (uart->hwflow_mode == ADI_UART_HWFLOW_PERI) {
+		/* CTS RTS PINs are negative assertive. */
+		UART_PUT_MCR(uart, UART_GET_MCR(uart) | ACTS);
+		UART_SET_IER(uart, EDSSI);
+	}
+
+	UART_SET_IER(uart, ERBFI);
+	return 0;
+}
+
+static void adi_uart_serial_shutdown(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	dev_dbg(uart->dev, "in serial_shutdown\n");
+
+	clk_disable_unprepare(uart->clk);
+}
+
+static void adi_uart_serial_set_termios(struct uart_port *port,
+		struct ktermios *termios, const struct ktermios *old)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	unsigned long flags;
+	unsigned int baud, quot;
+	unsigned int ier, lcr = 0;
+	unsigned long timeout;
+
+	if (uart->hwflow_mode == ADI_UART_HWFLOW_PERI)
+		termios->c_cflag |= CRTSCTS;
+
+	switch (termios->c_cflag & CSIZE) {
+	case CS8:
+		lcr = WLS(8);
+		break;
+	case CS7:
+		lcr = WLS(7);
+		break;
+	case CS6:
+		lcr = WLS(6);
+		break;
+	case CS5:
+		lcr = WLS(5);
+		break;
+	default:
+		dev_err(port->dev, "%s: word length not supported\n",
+			__func__);
+	}
+
+	if (termios->c_cflag & CSTOPB)
+		lcr |= STB;
+	if (termios->c_cflag & PARENB)
+		lcr |= PEN;
+	if (!(termios->c_cflag & PARODD))
+		lcr |= EPS;
+	if (termios->c_cflag & CMSPAR)
+		lcr |= STP;
+	if (termios->c_cflag & CRTSCTS)
+		uart->hwflow_en = true;
+	else
+		uart->hwflow_en = false;
+
+	spin_lock_irqsave(&uart->port.lock, flags);
+
+	port->read_status_mask = OE;
+	if (termios->c_iflag & INPCK)
+		port->read_status_mask |= (FE | PE);
+	if (termios->c_iflag & (BRKINT | PARMRK))
+		port->read_status_mask |= BI;
+
+	/*
+	 * Characters to ignore
+	 */
+	port->ignore_status_mask = 0;
+	if (termios->c_iflag & IGNPAR)
+		port->ignore_status_mask |= FE | PE;
+	if (termios->c_iflag & IGNBRK) {
+		port->ignore_status_mask |= BI;
+		/*
+		 * If we're ignoring parity and break indicators,
+		 * ignore overruns too (for real raw support).
+		 */
+		if (termios->c_iflag & IGNPAR)
+			port->ignore_status_mask |= OE;
+	}
+
+	/*
+	 * uart_get_divisor has a hardcoded /16 factor that will cause integer
+	 * round off errors if we're in divide-by-one mode
+	 */
+	if (uart->edbo) {
+		baud = uart_get_baud_rate(port, termios, old, 0,
+				port->uartclk);
+		quot = EDBO | DIV_ROUND_CLOSEST(port->uartclk, baud);
+	} else {
+		baud = uart_get_baud_rate(port, termios, old, 0,
+				port->uartclk/16);
+		quot = uart_get_divisor(port, baud);
+	}
+
+	/* Wait till the transfer buffer is empty */
+	timeout = jiffies + msecs_to_jiffies(10);
+	while (UART_GET_GCTL(uart) & UCEN && !(UART_GET_LSR(uart) & TEMT))
+		if (time_after(jiffies, timeout)) {
+			dev_warn(port->dev,
+				"timeout waiting for TX buffer empty\n");
+			break;
+		}
+
+	/* Wait till the transfer buffer is empty */
+	timeout = jiffies + msecs_to_jiffies(10);
+	while (UART_GET_GCTL(uart) & UCEN && !(UART_GET_LSR(uart) & TEMT))
+		if (time_after(jiffies, timeout)) {
+			dev_warn(port->dev,
+				"timeout waiting for TX buffer empty\n");
+			break;
+		}
+
+	/* Disable UART */
+	ier = UART_GET_IER(uart);
+	UART_PUT_GCTL(uart, UART_GET_GCTL(uart) & ~UCEN);
+	UART_DISABLE_INTS(uart);
+
+	UART_PUT_CLK(uart, quot);
+
+	UART_PUT_LCR(uart, (UART_GET_LCR(uart) & ~LCR_MASK) | lcr);
+
+	/* Enable UART */
+	UART_ENABLE_INTS(uart, ier);
+	UART_PUT_GCTL(uart, UART_GET_GCTL(uart) | UCEN);
+
+	/* Port speed changed, update the per-port timeout. */
+	uart_update_timeout(port, termios->c_cflag, baud);
+
+	spin_unlock_irqrestore(&uart->port.lock, flags);
+}
+
+static const char *adi_uart_serial_type(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	return uart->port.type == PORT_BFIN ? "ADI-UART" : NULL;
+}
+
+/*
+ * Release the memory region(s) being used by 'port'.
+ */
+static void adi_uart_serial_release_port(struct uart_port *port)
+{
+}
+
+/*
+ * Request the memory region(s) being used by 'port'.
+ */
+static int adi_uart_serial_request_port(struct uart_port *port)
+{
+	return 0;
+}
+
+/*
+ * Configure/autoconfigure the port.
+ */
+static void adi_uart_serial_config_port(struct uart_port *port, int flags)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	if (flags & UART_CONFIG_TYPE &&
+	    adi_uart_serial_request_port(&uart->port) == 0)
+		uart->port.type = PORT_BFIN;
+}
+
+/*
+ * Verify the new serial_struct (for TIOCSSERIAL).
+ * The only change we allow are to the flags and type, and
+ * even then only between PORT_BFIN and PORT_UNKNOWN
+ */
+static int
+adi_uart_serial_verify_port(struct uart_port *port, struct serial_struct *ser)
+{
+	return 0;
+}
+
+/*
+ * Enable the IrDA function if tty->ldisc.num is N_IRDA.
+ * In other cases, disable IrDA function.
+ */
+static void adi_uart_serial_set_ldisc(struct uart_port *port,
+		struct ktermios *termios)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	unsigned int val;
+
+	switch (termios->c_line) {
+	case N_IRDA:
+		val = UART_GET_GCTL(uart);
+		val |= (UMOD_IRDA | RPOLC);
+		UART_PUT_GCTL(uart, val);
+		break;
+	default:
+		val = UART_GET_GCTL(uart);
+		val &= ~(UMOD_MASK | RPOLC);
+		UART_PUT_GCTL(uart, val);
+	}
+}
+
+static void adi_uart_serial_reset_irda(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	unsigned int val;
+
+	val = UART_GET_GCTL(uart);
+	val &= ~(UMOD_MASK | RPOLC);
+	UART_PUT_GCTL(uart, val);
+	val |= (UMOD_IRDA | RPOLC);
+	UART_PUT_GCTL(uart, val);
+}
+
+#ifdef CONFIG_CONSOLE_POLL
+static void adi_uart_serial_poll_put_char(struct uart_port *port,
+		unsigned char chr)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	while (!(UART_GET_LSR(uart) & THRE))
+		cpu_relax();
+
+	UART_PUT_CHAR(uart, (unsigned char)chr);
+}
+
+static int adi_uart_serial_poll_get_char(struct uart_port *port)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+	unsigned char chr;
+
+	while (!(UART_GET_LSR(uart) & DR))
+		cpu_relax();
+
+	chr = UART_GET_CHAR(uart);
+
+	return chr;
+}
+#endif
+
+
+static const struct uart_ops adi_uart_serial_pops = {
+	.tx_empty	= adi_uart_serial_tx_empty,
+	.set_mctrl	= adi_uart_serial_set_mctrl,
+	.get_mctrl	= adi_uart_serial_get_mctrl,
+	.stop_tx	= adi_uart_serial_stop_tx,
+	.start_tx	= adi_uart_serial_start_tx,
+	.stop_rx	= adi_uart_serial_stop_rx,
+	.enable_ms	= adi_uart_serial_enable_ms,
+	.break_ctl	= adi_uart_serial_break_ctl,
+	.startup	= adi_uart_serial_startup,
+	.shutdown	= adi_uart_serial_shutdown,
+	.set_termios	= adi_uart_serial_set_termios,
+	.set_ldisc	= adi_uart_serial_set_ldisc,
+	.type		= adi_uart_serial_type,
+	.release_port	= adi_uart_serial_release_port,
+	.request_port	= adi_uart_serial_request_port,
+	.config_port	= adi_uart_serial_config_port,
+	.verify_port	= adi_uart_serial_verify_port,
+#ifdef CONFIG_CONSOLE_POLL
+	.poll_put_char	= adi_uart_serial_poll_put_char,
+	.poll_get_char	= adi_uart_serial_poll_get_char,
+#endif
+};
+
+#ifdef CONFIG_SERIAL_ADI_UART_CONSOLE
+static void adi_uart_serial_console_putchar(struct uart_port *port,
+		unsigned char ch)
+{
+	struct adi_uart_serial_port *uart = to_adi_serial_port(port);
+
+	while (!(UART_GET_LSR(uart) & THRE))
+		barrier();
+	UART_PUT_CHAR(uart, ch);
+}
+
+static void __init
+adi_uart_serial_console_get_options(struct adi_uart_serial_port *uart,
+		int *baud, int *parity, int *bits)
+{
+	unsigned int status;
+
+	status = UART_GET_IER(uart) & (ERBFI | ETBEI);
+	if (status == (ERBFI | ETBEI)) {
+		/* ok, the port was enabled */
+		u32 lcr, clk;
+
+		lcr = UART_GET_LCR(uart);
+
+		*parity = 'n';
+		if (lcr & PEN) {
+			if (lcr & EPS)
+				*parity = 'e';
+			else
+				*parity = 'o';
+		}
+		*bits = ((lcr & WLS_MASK) >> WLS_OFFSET) + 5;
+
+		clk = UART_GET_CLK(uart);
+
+		/* Only the lowest 16 bits are the divisor */
+		if (clk & EDBO)
+			*baud = uart->port.uartclk / (clk & 0xffff);
+		else
+			*baud = uart->port.uartclk / (16*clk);
+	}
+	pr_debug("%s:baud = %d, parity = %c, bits= %d\n", __func__,
+			*baud, *parity, *bits);
+}
+
+static void
+adi_uart_serial_console_write(struct console *co, const char *s,
+		unsigned int count)
+{
+	struct adi_uart_serial_port *uart = adi_uart_serial_ports[co->index];
+	unsigned long flags;
+
+	spin_lock_irqsave(&uart->port.lock, flags);
+	uart_console_write(&uart->port, s, count,
+			adi_uart_serial_console_putchar);
+	spin_unlock_irqrestore(&uart->port.lock, flags);
+
+}
+
+static int __init
+adi_uart_serial_console_setup(struct console *co, char *options)
+{
+	struct adi_uart_serial_port *uart;
+	int baud = 115200;
+	int bits = 8;
+	int parity = 'n';
+	int flow = 'n';
+
+	/*
+	 * Check whether an invalid uart number has been specified, and
+	 * if so, search for the first available port that does have
+	 * console support.
+	 */
+	if (co->index < 0 || co->index >= ADI_UART_NR_PORTS)
+		return -ENODEV;
+
+	uart = adi_uart_serial_ports[co->index];
+	if (!uart)
+		return -ENODEV;
+
+	if (uart->hwflow_mode == ADI_UART_HWFLOW_PERI)
+		flow = 'r';
+
+	if (options)
+		uart_parse_options(options, &baud, &parity, &bits, &flow);
+	else
+		adi_uart_serial_console_get_options(uart, &baud, &parity,
+				&bits);
+
+	return uart_set_options(&uart->port, co, baud, parity, bits, flow);
+}
+
+static struct uart_driver adi_uart_serial_reg;
+
+static struct console adi_uart_serial_console = {
+	.name		= "ttySC",
+	.write		= adi_uart_serial_console_write,
+	.device		= uart_console_device,
+	.setup		= adi_uart_serial_console_setup,
+	.flags		= CON_PRINTBUFFER,
+	.index		= -1,
+	.data		= &adi_uart_serial_reg,
+};
+
+
+#define ADI_SERIAL_UART_CONSOLE (&adi_uart_serial_console)
+#else
+#define ADI_SERIAL_UART_CONSOLE NULL
+#endif
+
+static struct uart_driver adi_uart_serial_reg = {
+	.owner			= THIS_MODULE,
+	.driver_name		= DRIVER_NAME,
+	.dev_name		= "ttySC",
+	.major			= TTY_MAJOR,
+#ifdef CONFIG_ARCH_SC59X_64
+	// Other serial drivers are using 64 --
+	// Can probably disable in the future and set this back to 64
+	.minor			= 74,
+#else
+	.minor			= 64,
+#endif
+	.nr			= ADI_UART_NR_PORTS,
+	.cons			= ADI_SERIAL_UART_CONSOLE,
+};
+
+static int adi_uart_serial_suspend(struct platform_device *pdev,
+		pm_message_t state)
+{
+	struct adi_uart_serial_port *uart = platform_get_drvdata(pdev);
+
+	clk_disable(uart->clk);
+	return uart_suspend_port(&adi_uart_serial_reg, &uart->port);
+}
+
+static int adi_uart_serial_resume(struct platform_device *pdev)
+{
+	struct adi_uart_serial_port *uart = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_enable(uart->clk);
+	if (ret)
+		return ret;
+
+	return uart_resume_port(&adi_uart_serial_reg, &uart->port);
+}
+
+static int adi_uart_serial_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct adi_uart_serial_port *uart = NULL;
+	int ret = 0;
+	int uartid;
+	dev_info(dev, "Serial probe\n");
+
+	uartid = of_alias_get_id(np, "serial");
+
+	if (uartid < 0) {
+		dev_err(&pdev->dev, "failed to get alias/pdev id, errno %d\n",
+				uartid);
+		ret = -ENODEV;
+		return ret;
+	}
+
+	if (adi_uart_serial_ports[uartid] == NULL) {
+		uart = kzalloc(sizeof(*uart), GFP_KERNEL);
+		if (!uart)
+			return -ENOMEM;
+
+		adi_uart_serial_ports[uartid] = uart;
+		uart->dev = &pdev->dev;
+
+		uart->clk = devm_clk_get(dev, "sclk0");
+		if (IS_ERR(uart->clk))
+			return -ENODEV;
+
+		spin_lock_init(&uart->port.lock);
+		uart->port.uartclk   = clk_get_rate(uart->clk);
+		uart->port.fifosize  = 8;
+		uart->port.ops       = &adi_uart_serial_pops;
+		uart->port.line      = uartid;
+		uart->port.iotype    = UPIO_MEM;
+		uart->port.flags     = UPF_BOOT_AUTOCONF;
+
+		uart->port.membase  = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(uart->port.membase))
+			return PTR_ERR(uart->port.membase);
+
+		uart->tx_irq = platform_get_irq_byname(pdev, "tx");
+		uart->rx_irq = platform_get_irq_byname(pdev, "rx");
+		uart->status_irq =
+			platform_get_irq_byname(pdev, "status");
+		uart->port.irq = uart->rx_irq;//
+		ret = devm_request_threaded_irq(dev, uart->rx_irq,
+			adi_uart_serial_rx_int, NULL, 0, "ADI UART RX",
+			uart);
+		if (ret) {
+			dev_err(dev, "Unable to attach UART RX int\n");
+			return ret;
+		}
+
+		ret = devm_request_threaded_irq(dev, uart->tx_irq,
+			adi_uart_serial_tx_int, NULL, 0, "ADI UART TX",
+			uart);
+		if (ret) {
+			dev_err(dev, "Unable to attach UART TX int\n");
+			return ret;
+		}
+
+		/* adi,uart-has-rtscts is deprecated */
+		if (of_property_read_bool(np, "uart-has-rtscts") ||
+		    of_property_read_bool(np, "adi,uart-has-rtscts")) {
+			uart->hwflow_mode = ADI_UART_HWFLOW_PERI;
+			ret = devm_request_threaded_irq(dev, uart->status_irq,
+				adi_uart_serial_mctrl_cts_int, NULL, 0,
+				"ADI UART Modem Status",
+				uart);
+			if (ret) {
+				uart->hwflow_mode = ADI_UART_NO_HWFLOW;
+				dev_info(dev,
+				"Unable to attach UART Modem Status int.\n");
+			}
+		} else
+			uart->hwflow_mode = ADI_UART_NO_HWFLOW;
+
+		uart->edbo = false;
+		if (of_property_read_bool(np, "adi,use-edbo"))
+			uart->edbo = true;
+
+		if (uart->hwflow_mode == ADI_UART_HWFLOW_PERI) {
+			uart->hwflow_en_pin = devm_gpiod_get(dev, "hwflow-en",
+					GPIOD_OUT_HIGH);
+			if (IS_ERR(uart->hwflow_en_pin)) {
+				dev_err(dev,
+				"hwflow-en required in peripheral hwflow mode\n");
+				return PTR_ERR(uart->hwflow_en_pin);
+			}
+		}
+	}
+
+	uart = adi_uart_serial_ports[uartid];
+	uart->port.dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, uart);
+
+	ret = uart_add_one_port(&adi_uart_serial_reg, &uart->port);
+	if (!ret)
+		return 0;
+
+	if (uart) {
+		adi_uart_serial_ports[uartid] = NULL;
+		kfree(uart);
+	}
+
+	return ret;
+}
+
+static void adi_uart_serial_remove(struct platform_device *pdev)
+{
+	struct adi_uart_serial_port *uart = platform_get_drvdata(pdev);
+
+	dev_set_drvdata(&pdev->dev, NULL);
+
+	if (uart) {
+		uart_remove_one_port(&adi_uart_serial_reg, &uart->port);
+		adi_uart_serial_ports[uart->port.line] = NULL;
+		kfree(uart);
+	}
+}
+
+static const struct of_device_id adi_uart_dt_match[] = {
+	{ .compatible = "adi,uart"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, adi_uart_dt_match);
+
+static struct platform_driver adi_uart_serial_driver = {
+	.probe		= adi_uart_serial_probe,
+	.remove		= adi_uart_serial_remove,
+	.suspend	= adi_uart_serial_suspend,
+	.resume		= adi_uart_serial_resume,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.owner	= THIS_MODULE,
+		.of_match_table	= adi_uart_dt_match,
+	},
+};
+
+static int __init adi_uart_serial_init(void)
+{
+	int ret;
+
+	pr_info("ADI serial driver\n");
+
+	ret = uart_register_driver(&adi_uart_serial_reg);
+	if (ret) {
+		pr_err("failed to register %s:%d\n",
+			adi_uart_serial_reg.driver_name, ret);
+	}
+
+	ret = platform_driver_register(&adi_uart_serial_driver);
+	if (ret) {
+		pr_err("fail to register ADI uart\n");
+		uart_unregister_driver(&adi_uart_serial_reg);
+	}
+
+	return ret;
+}
+
+static void __exit adi_uart_serial_exit(void)
+{
+	platform_driver_unregister(&adi_uart_serial_driver);
+	uart_unregister_driver(&adi_uart_serial_reg);
+}
+
+module_init(adi_uart_serial_init);
+module_exit(adi_uart_serial_exit);
+
+/* Early Console Support */
+static inline u32 adi_uart_read(struct uart_port *port, u32 off)
+{
+	return readl(port->membase + off);
+}
+
+static inline void adi_uart_write(struct uart_port *port, u32 val,
+				  u32 off)
+{
+	writel(val, port->membase + off);
+}
+
+
+static void adi_uart_wait_bit_set(struct uart_port *port, unsigned int offset,
+				  u32 bit)
+{
+	while (!(adi_uart_read(port, offset) & bit))
+		cpu_relax();
+}
+
+
+static void adi_uart_console_putchar(struct uart_port *port, unsigned char ch)
+{
+	/* wait for the hardware fifo to clear up */
+	adi_uart_wait_bit_set(port, OFFSET_STAT, THRE);
+
+	/* queue the character for transmission */
+	adi_uart_write(port, ch, OFFSET_THR);
+}
+
+
+static void adi_uart_early_write(struct console *con, const char *s,
+		unsigned int n)
+{
+	struct earlycon_device *dev = con->data;
+
+	uart_console_write(&dev->port, s, n, adi_uart_console_putchar);
+}
+
+
+static int __init adi_uart_early_console_setup(struct earlycon_device *device,
+					  const char *opt)
+{
+	if (!device->port.membase)
+		return -ENODEV;
+
+	device->con->write = adi_uart_early_write;
+	return 0;
+}
+
+EARLYCON_DECLARE(adi_uart, adi_uart_early_console_setup);
+
+MODULE_AUTHOR("Sonic Zhang, Aubrey Li");
+MODULE_DESCRIPTION("Blackfin/ADSP generic serial port driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS_CHARDEV_MAJOR(BFIN_SERIAL_MAJOR);
\ No newline at end of file
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
index 9c007a106330b90b92cbcf60a9ac806b290d6d44..ce3c50dfa5cacd09eb30e93e408c2d92992ac755 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -109,6 +109,9 @@
 /* Xilinx uartlite */
 #define PORT_UARTLITE	74
 
+/* Blackfin */
+#define PORT_BFIN	75
+
 /* Broadcom BCM7271 UART */
 #define PORT_BCM7271	76
 

-- 
2.25.1



