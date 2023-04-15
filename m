Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424F56E2FC0
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Apr 2023 10:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjDOIgw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Apr 2023 04:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDOIgu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Apr 2023 04:36:50 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 15 Apr 2023 01:36:46 PDT
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0FEE835BC
        for <linux-i2c@vger.kernel.org>; Sat, 15 Apr 2023 01:36:45 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id nbHFpiB5KmTnInbHFp7iHm; Sat, 15 Apr 2023 10:29:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
        s=t20230301; t=1681547353;
        bh=ySaQTfR2fSzaT35hG8hO7zFTzPQtmGl9/yVeVAatEfU=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=hzG2JzweLTY7vp4aYYL0Cw6CigX+yEawUsGLoxAxHrq08IyiBwegIi5f0FJbbzvFS
         oviFsoredP/u6Jp7vPD6lVVI7sAFbFf1eBdSv9MM0Uy+/PVUY0JLxTDMEefKFtmBt4
         27h6C30GLcFcycfCmOOpt5JgW7EW4ykhYIjBQrxoHI3pTt1+ddTm8W/KW88OUaTKOj
         xL+1Gq51AM7+RlhcFYT51As0ZUJiHvtExUcuiQa4wrrk0hnvbFoQ+ppnryjO18oNvI
         dTlHgTl5D+jGWOZ48UIJXVgHLv6aK81A8mdla4bfUgKl9aYZy9ihJe3RrSdeQ1HNbi
         J/64cgmKGxkHw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 15 Apr 2023 10:29:13 +0200
X-ME-IP: 86.243.2.178
Message-ID: <7f638e49-3aa8-45f6-cf14-86f11b004a12@wanadoo.fr>
Date:   Sat, 15 Apr 2023 10:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
 <20230415012848.1777768-3-ryan_chen__29933.816513379$1681522335$gmane$org@aspeedtech.com>
Content-Language: fr, en-US
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230415012848.1777768-3-ryan_chen__29933.816513379$1681522335$gmane$org@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 15/04/2023 à 03:28, Ryan Chen a écrit :
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

[...]

> +static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	int ret = 0;
> +	u32 ctrl;
> +	u32 state;
> +	int r;
> +
> +	dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr,
> +		readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +
> +	ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	i2c_bus->cmd_err = 0;
> +
> +	/* Check 0x14's SDA and SCL status */
> +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
> +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> +		if (r == 0) {
> +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> +			ret = -ETIMEDOUT;
> +		} else {
> +			if (i2c_bus->cmd_err) {
> +				dev_dbg(i2c_bus->dev, "recovery error\n");
> +				ret = -EPROTO;
> +			}
> +		}
> +	}
> +
> +	dev_dbg(i2c_bus->dev, "Recovery done [%x]\n",
> +		readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +	if (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) & AST2600_I2CC_BUS_BUSY_STS) {
> +		dev_dbg(i2c_bus->dev, "Can't recovery bus [%x]\n",

recover?

> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		ret = -EPROTO;
> +	}
> +
> +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	return ret;
> +}
> +
> +#ifdef CONFIG_I2C_SLAVE
> +static void ast2600_i2c_slave_packet_dma_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
> +{
> +	int slave_rx_len;
> +	u32 cmd = 0;
> +	u8 value;
> +	int i = 0;

No need to init

> +
> +	sts &= ~(AST2600_I2CS_SLAVE_PENDING);
> +	/* Handle i2c slave timeout condition */
> +	if (AST2600_I2CS_INACTIVE_TO & sts) {
> +		cmd = SLAVE_TRIGGER_CMD;
> +		cmd |= AST2600_I2CS_RX_DMA_EN;
> +		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		return;
> +	}
> +
> +	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		slave_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +						      AST2600_I2CS_DMA_LEN_STS));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED,
> +					&i2c_bus->slave_dma_buf[i]);
> +		}
> +		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +				i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +				i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE_NAK |
> +			AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA |
> +			AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE_NAK | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +		slave_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +						      AST2600_I2CS_DMA_LEN_STS));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED,
> +					&i2c_bus->slave_dma_buf[i]);
> +		}
> +		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		if (sts & AST2600_I2CS_STOP)
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +
> +	/* it is Mw data Mr coming -> it need send tx */
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
> +		/* it should be repeat start read */
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +		slave_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +						      AST2600_I2CS_DMA_LEN_STS));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED,
> +					&i2c_bus->slave_dma_buf[i]);
> +		}
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED,
> +				&i2c_bus->slave_dma_buf[0]);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
> +		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
> +				i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA:
> +		/* First Start read */
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED,
> +				&i2c_bus->slave_dma_buf[0]);
> +		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
> +				i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_WAIT_TX_DMA:
> +		/* it should be next start read */
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_PROCESSED,
> +				&i2c_bus->slave_dma_buf[0]);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
> +		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
> +				i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
> +		break;

Having a new line or not after breaks is not consistent.

> +
> +	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
> +		/* it just tx complete */
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
> +		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
> +		cmd = 0;
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		break;
> +	case AST2600_I2CS_STOP:
> +		cmd = 0;
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled slave isr case %x, sts %x\n", sts,
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		break;
> +	}
> +
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +}
> +
> +static void ast2600_i2c_slave_packet_buff_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
> +{
> +	int slave_rx_len = 0;
> +	u32 cmd = 0;
> +	u8 value;
> +	int i = 0;

No need to init;

> +
> +	/* due to master slave is common buffer, so need force the master stop not issue */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & 0xffff) {
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		i2c_bus->cmd_err = -EBUSY;
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		complete(&i2c_bus->cmd_complete);
> +	}
> +
> +	/* Handle i2c slave timeout condition */
> +	if (AST2600_I2CS_INACTIVE_TO & sts) {
> +		writel(SLAVE_TRIGGER_CMD, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		i2c_bus->slave_operate = 0;
> +		return;
> +	}
> +
> +	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
> +
> +	if (sts & AST2600_I2CS_SLAVE_MATCH)
> +		i2c_bus->slave_operate = 1;
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		fallthrough;
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		cmd = SLAVE_TRIGGER_CMD;
> +		if (sts & AST2600_I2CS_RX_DONE) {
> +			slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							       AST2600_I2CC_BUFF_CTRL));
> +			for (i = 0; i < slave_rx_len; i++) {
> +				value = readb(i2c_bus->buf_base + 0x10 + i);
> +				i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +			}
> +		}
> +		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) & AST2600_I2CS_RX_BUFF_EN)
> +			cmd = 0;
> +		else
> +			cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
> +
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +					i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		break;
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_RX_DONE:
> +		cmd = SLAVE_TRIGGER_CMD;
> +		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +						       AST2600_I2CC_BUFF_CTRL));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			value = readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +		cmd |= AST2600_I2CS_RX_BUFF_EN;
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +						i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		break;
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> +				AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +		cmd = SLAVE_TRIGGER_CMD;
> +		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +						       AST2600_I2CC_BUFF_CTRL));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			value = readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		cmd |= AST2600_I2CS_RX_BUFF_EN;
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +						i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		break;
> +

Having a new line or not after breaks is not consistent.

> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +		cmd = SLAVE_TRIGGER_CMD;
> +		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							   AST2600_I2CC_BUFF_CTRL));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			value = readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +		/* workaround for avoid next start with len != 0 */
> +		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		break;
> +
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +		cmd = SLAVE_TRIGGER_CMD;
> +		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							   AST2600_I2CC_BUFF_CTRL));
> +		for (i = 0; i < slave_rx_len; i++) {
> +			value = readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +		/* workaround for avoid next start with len != 0 */
> +		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		break;
> +	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_SLAVE_MATCH:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +		writeb(value, i2c_bus->buf_base);
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
> +				i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
> +		break;
> +	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA:
> +		if (sts & AST2600_I2CS_RX_DONE) {
> +			slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							AST2600_I2CC_BUFF_CTRL));
> +			for (i = 0; i < slave_rx_len; i++) {
> +				value = readb(i2c_bus->buf_base + 0x10 + i);
> +				i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +			}
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +		} else {
> +			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> +		}
> +		writeb(value, i2c_bus->buf_base);
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
> +				i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
> +		break;
> +	/* workaround : trigger the cmd twice to fix next state keep 1000000 */
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		break;
> +
> +	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_STOP:
> +		cmd = SLAVE_TRIGGER_CMD;
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled slave isr case %x, sts %x\n", sts,
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		break;
> +	}
> +
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if ((sts & AST2600_I2CS_STOP) && !(sts & AST2600_I2CS_SLAVE_PENDING))
> +		i2c_bus->slave_operate = 0;
> +

Nit: unneeded empty line.

> +}
> +
> +static void ast2600_i2c_slave_byte_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
> +{
> +	u32 i2c_buff = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	u32 cmd = AST2600_I2CS_ACTIVE_ALL;
> +	u8 byte_data;
> +	u8 value;
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		/* first address match is address */
> +		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
> +		break;
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
> +		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &byte_data);
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
> +		cmd |= AST2600_I2CS_TX_CMD;
> +		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED, &byte_data);
> +		writel(byte_data, i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +		break;
> +	case AST2600_I2CS_TX_ACK | AST2600_I2CS_WAIT_TX_DMA:
> +		cmd |= AST2600_I2CS_TX_CMD;
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_PROCESSED, &byte_data);
> +		writel(byte_data, i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +		break;
> +	case AST2600_I2CS_STOP:
> +	case AST2600_I2CS_STOP | AST2600_I2CS_TX_NAK:
> +		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled pkt isr %x\n", sts);
> +		break;
> +	}
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(sts, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +}
> +
> +static int ast2600_i2c_slave_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 ier = readl(i2c_bus->reg_base + AST2600_I2CS_IER);
> +	u32 isr = readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if (!(isr & ier))
> +		return 0;
> +
> +	/* Slave interrupt coming after Master package done
> +	 * So need handle master first.
> +	 */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_ISR) & AST2600_I2CM_PKT_DONE)
> +		return 0;
> +
> +	isr &= ~(AST2600_I2CS_ADDR_INDICATE_MASK);
> +
> +	if (AST2600_I2CS_ADDR1_NAK & isr)
> +		isr &= ~AST2600_I2CS_ADDR1_NAK;
> +
> +	if (AST2600_I2CS_ADDR2_NAK & isr)
> +		isr &= ~AST2600_I2CS_ADDR2_NAK;
> +
> +	if (AST2600_I2CS_ADDR3_NAK & isr)
> +		isr &= ~AST2600_I2CS_ADDR3_NAK;
> +
> +	if (AST2600_I2CS_ADDR_MASK & isr)
> +		isr &= ~AST2600_I2CS_ADDR_MASK;
> +
> +	if (AST2600_I2CS_PKT_DONE & isr) {
> +		if (i2c_bus->mode == DMA_MODE)
> +			ast2600_i2c_slave_packet_dma_irq(i2c_bus, isr);
> +		else
> +			ast2600_i2c_slave_packet_buff_irq(i2c_bus, isr);
> +	} else
> +		ast2600_i2c_slave_byte_irq(i2c_bus, isr);
> +
> +	return 1;
> +}
> +#endif
> +
> +static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len = 0;
> +	int i = 0;

No need to init.

> +	u32 cmd;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) | AST2600_I2CM_START_CMD;
> +
> +	/* send start */
> +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> +		i2c_bus->msgs_index, msg->flags & I2C_M_RD ? "read" : "write",
> +		msg->len, msg->len > 1 ? "s" : "",
> +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
> +
> +	i2c_bus->master_xfer_cnt = 0;
> +	i2c_bus->buf_index = 0;

[...]

> +static int ast2600_i2c_master_xfer(struct i2c_adapter *adap,
> +				      struct i2c_msg *msgs, int num)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(adap);
> +	unsigned long timeout;
> +	int ret = 0;

Looks like this initialization is unneeded.

> +
> +	/* If bus is busy in a single master environment, attempt recovery. */
> +	if (!i2c_bus->multi_master &&
> +	    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) & AST2600_I2CC_BUS_BUSY_STS)) {
> +		int ret;

No need for an extra 'ret'.

> +
> +		ret = ast2600_i2c_recover_bus(i2c_bus);
> +		if (ret)
> +			return ret;
> +	}
> +
> +#ifdef CONFIG_I2C_SLAVE
> +	if (i2c_bus->mode == BUFF_MODE) {
> +		if (i2c_bus->slave_operate)
> +			return -EBUSY;
> +		/* disable slave isr */
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
> +		if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) || (i2c_bus->slave_operate)) {
> +			writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +			return -EBUSY;
> +		}
> +	}
> +#endif
> +
> +	i2c_bus->cmd_err = 0;
> +	i2c_bus->msgs = msgs;
> +	i2c_bus->msgs_index = 0;
> +	i2c_bus->msgs_count = num;
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	ret = ast2600_i2c_do_start(i2c_bus);
> +#ifdef CONFIG_I2C_SLAVE
> +	/* avoid race condication slave is wait and master wait 1st slave operate */
> +	if (i2c_bus->mode == BUFF_MODE)
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +#endif
> +	if (ret)
> +		goto master_out;
> +	timeout = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> +	if (timeout == 0) {
> +		u32 isr = readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		u32 i2c_status = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +
> +		dev_dbg(i2c_bus->dev, "timeout isr[%x], sts[%x]\n", isr, i2c_status);
> +		if (isr || (i2c_status & AST2600_I2CC_TX_DIR_MASK)) {
> +			u32 ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +			writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +			writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +#ifdef CONFIG_I2C_SLAVE
> +			if (ctrl & AST2600_I2CC_SLAVE_EN) {
> +				u32 cmd = SLAVE_TRIGGER_CMD;
> +
> +				if (i2c_bus->mode == DMA_MODE) {
> +					cmd |= AST2600_I2CS_RX_DMA_EN;
> +					writel(i2c_bus->slave_dma_addr,
> +						   i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
> +					writel(i2c_bus->slave_dma_addr,
> +						   i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
> +					writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +						   i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +				} else if (i2c_bus->mode == BUFF_MODE) {
> +					cmd = SLAVE_TRIGGER_CMD;
> +				} else {
> +					cmd &= ~AST2600_I2CS_PKT_MODE_EN;
> +				}
> +				writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +			}
> +#endif
> +		}
> +		ret = -ETIMEDOUT;
> +	} else {
> +		ret = i2c_bus->cmd_err;
> +	}
> +
> +	dev_dbg(i2c_bus->dev, "bus%d-m: %d end\n", i2c_bus->adap.nr, i2c_bus->cmd_err);
> +
> +master_out:
> +	if (i2c_bus->mode == DMA_MODE) {
> +		kfree(i2c_bus->master_safe_buf);
> +	    i2c_bus->master_safe_buf = NULL;

Alignement.

> +	}
> +
> +	return ret;
> +}
> +
> +static void ast2600_i2c_init(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct platform_device *pdev = to_platform_device(i2c_bus->dev);
> +	u32 fun_ctrl = AST2600_I2CC_BUS_AUTO_RELEASE | AST2600_I2CC_MASTER_EN;
> +
> +	/* I2C Reset */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "multi-master"))
> +		i2c_bus->multi_master = true;
> +	else
> +		fun_ctrl |= AST2600_I2CC_MULTI_MASTER_DIS;
> +
> +	/* Enable Master Mode */
> +	writel(fun_ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	/* disable slave address */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	/* Set AC Timing */
> +	writel(ast2600_select_i2c_clock(i2c_bus), i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
> +
> +	/* Clear Interrupt */
> +	writel(0xfffffff, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +
> +#ifdef CONFIG_I2C_SLAVE
> +	/* for memory buffer initial */
> +	if (i2c_bus->mode == DMA_MODE) {
> +		i2c_bus->slave_dma_buf = dma_alloc_coherent(i2c_bus->dev, I2C_SLAVE_MSG_BUF_SIZE,
> +							    &i2c_bus->slave_dma_addr, GFP_KERNEL);

dmam_alloc_coherent() could maybe be used here.
This would simplify the remove function and avoid some conditional 
compilation.
This also fixes a leak if i2c_add_adapter() fails in the probe.

It is also likely that doing so, the devm_free_irq() in the remove 
function also becomes redundant and can be removed as well.

> +		if (!i2c_bus->slave_dma_buf)
> +			return;
> +	}
> +
> +	writel(0xfffffff, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if (i2c_bus->mode == BYTE_MODE) {
> +		writel(0xffff, i2c_bus->reg_base + AST2600_I2CS_IER);
> +	} else {
> +		/* Set interrupt generation of I2C slave controller */
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +	}
> +#endif
> +}
> +
> +#ifdef CONFIG_I2C_SLAVE
> +static int ast2600_i2c_reg_slave(struct i2c_client *client)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(client->adapter);
> +	u32 cmd = SLAVE_TRIGGER_CMD;
> +
> +	if (i2c_bus->slave)
> +		return -EINVAL;
> +
> +	dev_dbg(i2c_bus->dev, "slave addr %x\n", client->addr);
> +
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +	writel(AST2600_I2CC_SLAVE_EN | readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	/* trigger rx buffer */
> +	if (i2c_bus->mode == DMA_MODE) {
> +		cmd |= AST2600_I2CS_RX_DMA_EN;
> +		writel(i2c_bus->slave_dma_addr, i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
> +		writel(i2c_bus->slave_dma_addr, i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
> +		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +	} else if (i2c_bus->mode == BUFF_MODE) {
> +		cmd = SLAVE_TRIGGER_CMD;
> +	} else {
> +		cmd &= ~AST2600_I2CS_PKT_MODE_EN;
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	i2c_bus->slave = client;
> +	/* Set slave addr. */
> +	writel(client->addr | AST2600_I2CS_ADDR1_ENABLE,
> +			i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);

Nit: alignement

> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(slave->adapter);
> +
> +	WARN_ON(!i2c_bus->slave);
> +
> +	/* Turn off slave mode. */
> +	writel(~AST2600_I2CC_SLAVE_EN & readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(readl(i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL) & ~AST2600_I2CS_ADDR1_MASK,
> +	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	i2c_bus->slave = NULL;
> +
> +	return 0;
> +}
> +#endif
> +
> +static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
> +}
> +
> +static const struct i2c_algorithm i2c_ast2600_algorithm = {
> +	.master_xfer = ast2600_i2c_master_xfer,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave = ast2600_i2c_reg_slave,
> +	.unreg_slave = ast2600_i2c_unreg_slave,
> +#endif
> +	.functionality = ast2600_i2c_functionality,
> +};
> +
> +static const struct of_device_id ast2600_i2c_bus_of_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-i2cv2",
> +	},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
> +
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret = 0;
> +
> +	i2c_bus = devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;
> +
> +	i2c_bus->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_bus->reg_base))
> +		return PTR_ERR(i2c_bus->reg_base);
> +
> +	i2c_bus->rst = devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n");
> +
> +	reset_control_deassert(i2c_bus->rst);
> +
> +	i2c_bus->global_regs = syscon_regmap_lookup_by_phandle(np, "aspeed,global-regs");
> +	if (IS_ERR(i2c_bus->global_regs))
> +		return PTR_ERR(i2c_bus->global_regs);
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CTRL, &global_ctrl);
> +	if ((global_ctrl & AST2600_GLOBAL_INIT) != AST2600_GLOBAL_INIT) {
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CTRL, AST2600_GLOBAL_INIT);
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DIV_CTRL);
> +	}
> +
> +	i2c_bus->slave_operate = 0;
> +	i2c_bus->dev = dev;
> +	i2c_bus->mode = BUFF_MODE;
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "aspeed,enable-dma"))
> +		i2c_bus->mode = DMA_MODE;
> +
> +	if (i2c_bus->mode == BUFF_MODE) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (res && resource_size(res) >= 2) {
> +			i2c_bus->buf_base = devm_ioremap_resource(dev, res);
> +
> +			if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> +				i2c_bus->buf_size = resource_size(res)/2;
> +		} else
> +			i2c_bus->mode = BYTE_MODE;
> +	}
> +
> +	/* i2c timeout counter: use base clk4 1Mhz,
> +	 * per unit: 1/(1000/4096) = 4096us
> +	 */
> +	ret = of_property_read_u32(dev->of_node,
> +							"i2c-scl-clk-low-timeout-us",
> +							&i2c_bus->timeout);

Strange layout.

> +	if (ret < 0)
> +		i2c_bus->timeout = 0;

Nit: This is not really needed since i2c_bus is kzalloc()'ed.

> +	else
> +		i2c_bus->timeout /= 4096;
> +
> +	init_completion(&i2c_bus->cmd_complete);
> +
> +	i2c_bus->irq = platform_get_irq(pdev, 0);
> +	if (i2c_bus->irq < 0)
> +		return i2c_bus->irq;
> +
> +	platform_set_drvdata(pdev, i2c_bus);
> +
> +	i2c_bus->clk = devm_clk_get(i2c_bus->dev, NULL);
> +	if (IS_ERR(i2c_bus->clk))
> +		return dev_err_probe(i2c_bus->dev, PTR_ERR(i2c_bus->clk), "Can't get clock\n");
> +
> +	i2c_bus->apb_clk = clk_get_rate(i2c_bus->clk);
> +
> +	ret = of_property_read_u32(dev->of_node, "clock-frequency", &i2c_bus->bus_frequency);
> +	if (ret < 0) {
> +		dev_warn(dev, "Could not read clock-frequency property\n");
> +		i2c_bus->bus_frequency = 100000;
> +	}
> +
> +	/* Initialize the I2C adapter */
> +	i2c_bus->adap.owner = THIS_MODULE;
> +	i2c_bus->adap.algo = &i2c_ast2600_algorithm;
> +	i2c_bus->adap.retries = 0;
> +	i2c_bus->adap.dev.parent = i2c_bus->dev;
> +	i2c_bus->adap.dev.of_node = dev->of_node;
> +	i2c_bus->adap.algo_data = i2c_bus;
> +	strscpy(i2c_bus->adap.name, pdev->name, sizeof(i2c_bus->adap.name));
> +	i2c_set_adapdata(&i2c_bus->adap, i2c_bus);
> +
> +	ast2600_i2c_init(i2c_bus);
> +
> +	ret = devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> +			       dev_name(dev), i2c_bus);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n", i2c_bus->irq);
> +
> +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
> +		i2c_bus->alert_enable = 1;
> +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap, &i2c_bus->alert_data);
> +		if (!i2c_bus->ara)
> +			dev_warn(dev, "Failed to register ARA client\n");
> +
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER | AST2600_I2CM_SMBUS_ALT,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	} else {
> +		i2c_bus->alert_enable = 0;
> +		/* Set interrupt generation of I2C master controller */
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +				i2c_bus->reg_base + AST2600_I2CM_IER);
> +	}
> +
> +	ret = i2c_add_adapter(&i2c_bus->adap);

Maybe devm_i2c_add_adapter() + remove function simplification.
This change + dmam_alloc_coherent() above + removing devm_free_irq() 
should, all together, not chnage the order of the remove function IIUIC.

CJ

> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "%s [%d]: adapter [%d khz] mode [%d]\n",
> +		 dev->of_node->name, i2c_bus->adap.nr, i2c_bus->bus_frequency / 1000,
> +		 i2c_bus->mode);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +
> +	i2c_del_adapter(&i2c_bus->adap);
> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
> +
> +#ifdef CONFIG_I2C_SLAVE
> +	/* for memory buffer initial */
> +	if (i2c_bus->mode == DMA_MODE)
> +		dma_free_coherent(i2c_bus->dev, I2C_SLAVE_MSG_BUF_SIZE,
> +				i2c_bus->slave_dma_buf, i2c_bus->slave_dma_addr);
> +#endif
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ast2600_i2c_bus_driver = {
> +	.probe = ast2600_i2c_probe,
> +	.remove = ast2600_i2c_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = ast2600_i2c_bus_of_table,
> +	},
> +};
> +module_platform_driver(ast2600_i2c_bus_driver);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED AST2600 I2C Controller Driver");
> +MODULE_LICENSE("GPL");

