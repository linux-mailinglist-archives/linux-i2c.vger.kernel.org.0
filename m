Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B451277DC
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2019 10:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfLTJRo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Dec 2019 04:17:44 -0500
Received: from mail-dm6nam11on2067.outbound.protection.outlook.com ([40.107.223.67]:41087
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726111AbfLTJRn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Dec 2019 04:17:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRIJvXdKHE66aNoLgIV9ETQfO3qm9WonuD/6z7wuiENwr1rEi6gA/GIe6Yo+FoXsvWN75nAA7kcRr3gG84aP63Wdlm5GdsMiVRAkVW3sLKxhl7KVH0Owv5SGhOeAyiYWeDNkoULbgZrpT+d7KqCsRGM1ZBWjJtNiJlohRAscVf9Aq3rUP/lKmquv1s5otqrPy5CmC1t1IblcoDpYilH7FljVIP0zfBZhau3CUVaxWas6k1DJWOKg5d8P4ZBxK7e5LUSywQyCr1pyZS29xZ54KMZILneHZnt9yWOiWasYO6eilwpyXEPab0SwN0wtt1vAQDatvHgJHP9DVt98r/XWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH7odFoijctnO0d3CMp8/usEd5JbYgCg5UFlICCGGHo=;
 b=bU34r1+4gmJc8KIjHvOIeG+dRyieo8CVa75eWUSjvADPux4oHGIrbYg+EPNg8jBuPciG77UkuJNQuNt7uy9TTER3IVlvMEykh+8VYCIfhSXpXtjcteS1i/EZBYISbkvaXmIgJpTlGFxWvUYgoi/BpYRot5JmQN+v8rxZJ4p6k4QSHyUo77Bpjs4OtqSgKQUgum2nxAYmX1E1qRuuz8ni8kyYjXppQDGx6NmaAFEXY2KDopgeqWvYhq+37HQeOzD5FyGSPKaBc6jqpN+CpMbwwvwTohOyHTN/HF3tXSrYo95QG0kLiUdTueCR/ciw9HG5e17LQ8X7FLagrQx5quVjbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=upb.ro smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH7odFoijctnO0d3CMp8/usEd5JbYgCg5UFlICCGGHo=;
 b=UP3d03UEDVKP59cVA/7b6pOvaHKAv32l7k81yR+rFUdNCWVTrhW3bzlzay4KAlEqephIxBGLT1s7RrAiaiK2YrOpwl3mx6foI8/uj9uMZhaw0axo8+7N+HXV5LbZeGtil+UW0ryivwUPCzvy6FrF362vbGa+0u6DkDXfO1GwPno=
Received: from DM6PR02CA0104.namprd02.prod.outlook.com (2603:10b6:5:1f4::45)
 by BYAPR02MB5655.namprd02.prod.outlook.com (2603:10b6:a03:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16; Fri, 20 Dec
 2019 09:17:34 +0000
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by DM6PR02CA0104.outlook.office365.com
 (2603:10b6:5:1f4::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Fri, 20 Dec 2019 09:17:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; upb.ro; dkim=none (message not signed)
 header.d=none;upb.ro; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT020.mail.protection.outlook.com (10.152.75.191) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
 via Frontend Transport; Fri, 20 Dec 2019 09:17:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iiEPc-0004A0-T6; Fri, 20 Dec 2019 01:17:32 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iiEPX-0006wd-PG; Fri, 20 Dec 2019 01:17:27 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xBK9HKaS015987;
        Fri, 20 Dec 2019 01:17:20 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iiEPQ-0006vp-2H; Fri, 20 Dec 2019 01:17:20 -0800
Subject: Re: [PATCH] i2c: cadence: Added slave support
To:     Radu Pirea <radu_nicolae.pirea@upb.ro>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Cc:     Chirag Parekh <chirag.parekh@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20191219124120.53754-1-radu_nicolae.pirea@upb.ro>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <46bb9f71-2add-211f-219b-c09e2ebae922@xilinx.com>
Date:   Fri, 20 Dec 2019 10:17:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219124120.53754-1-radu_nicolae.pirea@upb.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(54906003)(110136005)(81156014)(81166006)(8676002)(6636002)(356004)(8936002)(9786002)(26005)(6666004)(2906002)(336012)(426003)(30864003)(44832011)(31696002)(36756003)(31686004)(5660300002)(4326008)(316002)(107886003)(478600001)(70586007)(2616005)(70206006)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5655;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dd9e087-bc98-49e3-2a0e-08d7852d726d
X-MS-TrafficTypeDiagnostic: BYAPR02MB5655:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5655BAEB72B06748ED6A6757C62D0@BYAPR02MB5655.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 025796F161
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08s7TbpNQAyVNV1ZsC1FcahFX25t0hJsVWRszE1jua+4AV7NNnd7c2lzqINuGTQaACqsxCaukkLq7wheH+LpwvrGxwh/DJqyeGcsUzFwrfkL8nNeuXOE5xV9HhfG3lWkuNZVGMcRx48LQmazIm77VFUYdHPceSWOhR4o99QUB+a/nHvKBKerN9inFJOL2X+IooOaNFRDzM0H5wGrqy0JOXnM891cErCVsWPr3qSUNLcpHGb5SVK5pqikWlD1yobhna8HtkSt7LQL+JJLn/4ks2rTX5jIREoXRSEQ2v6CRJOZNOW5s4HLyQB/Rf5nNMsu4DQ3GQhUWshlXZwH50aPMHgugqinJA5t9ldDMykyEMFyssn8lExvCuET9G7zzzKcblpqUq9/TF1kxniK/Ehhp46yKlh3HnKfEhMzwZjf/a3J/wrn6gvH0opp/8XaywxN
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2019 09:17:33.3421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd9e087-bc98-49e3-2a0e-08d7852d726d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5655
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19. 12. 19 13:41, Radu Pirea wrote:
> Added support for I2C slave functionality
> 
> Signed-off-by: Chirag Parekh <chirag.parekh@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Radu Pirea <radu_nicolae.pirea@upb.ro>
> ---
> 
> Hi,
> 
> This patch implements the slave interface for the i2c cadence driver. Most of the
> work has been done by the guys from Xilinx. All I have done it was to port the
> patch to the upstream kernel, test it and fix some minor issues.
> 
> Any suggestion about how can I improve this patch is welcome.
> 
> Thanks.
> 
> Radu P.
> 
>  drivers/i2c/busses/i2c-cadence.c | 317 ++++++++++++++++++++++++++++++-
>  1 file changed, 307 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 9d71ce15db05..ea6bf989ba1c 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -23,6 +23,7 @@
>  #define CDNS_I2C_ISR_OFFSET		0x10 /* IRQ Status Register, RW */
>  #define CDNS_I2C_XFER_SIZE_OFFSET	0x14 /* Transfer Size Register, RW */
>  #define CDNS_I2C_TIME_OUT_OFFSET	0x1C /* Time Out Register, RW */
> +#define CDNS_I2C_IMR_OFFSET		0x20 /* IRQ Mask Register, RO */
>  #define CDNS_I2C_IER_OFFSET		0x24 /* IRQ Enable Register, WO */
>  #define CDNS_I2C_IDR_OFFSET		0x28 /* IRQ Disable Register, WO */
>  
> @@ -40,9 +41,17 @@
>  #define CDNS_I2C_CR_DIVB_SHIFT		8
>  #define CDNS_I2C_CR_DIVB_MASK		(0x3f << CDNS_I2C_CR_DIVB_SHIFT)
>  
> +#define CDNS_I2C_CR_MASTER_EN_MASK	(CDNS_I2C_CR_NEA | \
> +					 CDNS_I2C_CR_ACK_EN | \
> +					 CDNS_I2C_CR_MS)
> +
> +#define CDNS_I2C_CR_SLAVE_EN_MASK	~CDNS_I2C_CR_MASTER_EN_MASK
> +
>  /* Status Register Bit mask definitions */
>  #define CDNS_I2C_SR_BA		BIT(8)
> +#define CDNS_I2C_SR_TXDV	BIT(6)
>  #define CDNS_I2C_SR_RXDV	BIT(5)
> +#define CDNS_I2C_SR_RXRW	BIT(3)
>  
>  /*
>   * I2C Address Register Bit mask definitions
> @@ -91,6 +100,14 @@
>  					 CDNS_I2C_IXR_DATA | \
>  					 CDNS_I2C_IXR_COMP)
>  
> +#define CDNS_I2C_IXR_SLAVE_INTR_MASK	(CDNS_I2C_IXR_RX_UNF | \
> +					 CDNS_I2C_IXR_TX_OVF | \
> +					 CDNS_I2C_IXR_RX_OVF | \
> +					 CDNS_I2C_IXR_TO | \
> +					 CDNS_I2C_IXR_NACK | \
> +					 CDNS_I2C_IXR_DATA | \
> +					 CDNS_I2C_IXR_COMP)
> +
>  #define CDNS_I2C_TIMEOUT		msecs_to_jiffies(1000)
>  /* timeout for pm runtime autosuspend */
>  #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
> @@ -117,6 +134,32 @@
>  #define cdns_i2c_readreg(offset)       readl_relaxed(id->membase + offset)
>  #define cdns_i2c_writereg(val, offset) writel_relaxed(val, id->membase + offset)
>  
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +/**
> + * enum cdns_i2c_mode - I2C Controller current operating mode
> + *
> + * @CDNS_I2C_MODE_SLAVE:       I2C controller operating in slave mode
> + * @CDNS_I2C_MODE_MASTER:      I2C Controller operating in master mode
> + */
> +enum cdns_i2c_mode {
> +	CDNS_I2C_MODE_SLAVE,
> +	CDNS_I2C_MODE_MASTER,
> +};
> +
> +/**
> + * enum cdns_i2c_slave_mode - Slave state when I2C is operating in slave mode
> + *
> + * @CDNS_I2C_SLAVE_STATE_IDLE: I2C slave idle
> + * @CDNS_I2C_SLAVE_STATE_SEND: I2C slave sending data to master
> + * @CDNS_I2C_SLAVE_STATE_RECV: I2C slave receiving data from master
> + */
> +enum cdns_i2c_slave_state {
> +	CDNS_I2C_SLAVE_STATE_IDLE,
> +	CDNS_I2C_SLAVE_STATE_SEND,
> +	CDNS_I2C_SLAVE_STATE_RECV,
> +};
> +#endif
> +
>  /**
>   * struct cdns_i2c - I2C device private data structure
>   *
> @@ -138,6 +181,10 @@
>   * @clk:		Pointer to struct clk
>   * @clk_rate_change_nb:	Notifier block for clock rate changes
>   * @quirks:		flag for broken hold bit usage in r1p10
> + * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
> + * @slave:		Registered slave instance.
> + * @dev_mode:		I2C operating role(master/slave).
> + * @slave_state:	I2C Slave state(idle/read/write).
>   */
>  struct cdns_i2c {
>  	struct device		*dev;
> @@ -158,6 +205,12 @@ struct cdns_i2c {
>  	struct clk *clk;
>  	struct notifier_block clk_rate_change_nb;
>  	u32 quirks;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	u16 ctrl_reg_diva_divb;
> +	struct i2c_client *slave;
> +	enum cdns_i2c_mode dev_mode;
> +	enum cdns_i2c_slave_state slave_state;
> +#endif
>  };
>  
>  struct cdns_platform_data {
> @@ -186,17 +239,155 @@ static inline bool cdns_is_holdquirk(struct cdns_i2c *id, bool hold_wrkaround)
>  		(id->curr_recv_count == CDNS_I2C_FIFO_DEPTH + 1));
>  }
>  
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void cdns_i2c_set_mode(enum cdns_i2c_mode mode, struct cdns_i2c *id)
> +{
> +	/* Disable all interrupts */
> +	cdns_i2c_writereg(CDNS_I2C_IXR_ALL_INTR_MASK, CDNS_I2C_IDR_OFFSET);
> +
> +	/* Clear FIFO and transfer size */
> +	cdns_i2c_writereg(CDNS_I2C_CR_CLR_FIFO, CDNS_I2C_CR_OFFSET);
> +
> +	/* Update device mode and state */
> +	id->dev_mode = mode;
> +	id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
> +
> +	switch (mode) {
> +	case CDNS_I2C_MODE_MASTER:
> +		/* Enable i2c master */
> +		cdns_i2c_writereg(id->ctrl_reg_diva_divb |
> +				  CDNS_I2C_CR_MASTER_EN_MASK,
> +				  CDNS_I2C_CR_OFFSET);
> +		/*
> +		 * This delay is needed to give the IP some time to switch to
> +		 * the master mode. With lower values(like 110 us) i2cdetect
> +		 * will not detect any slave and without this delay, the IP will
> +		 * trigger a timeout interrupt.
> +		 */
> +		usleep_range(115, 125);
> +		break;
> +	case CDNS_I2C_MODE_SLAVE:
> +		/* Enable i2c slave */
> +		cdns_i2c_writereg(id->ctrl_reg_diva_divb &
> +				  CDNS_I2C_CR_SLAVE_EN_MASK,
> +				  CDNS_I2C_CR_OFFSET);
> +
> +		/* Setting slave address */
> +		cdns_i2c_writereg(id->slave->addr & CDNS_I2C_ADDR_MASK,
> +				  CDNS_I2C_ADDR_OFFSET);
> +
> +		/* Enable slave send/receive interrupts */
> +		cdns_i2c_writereg(CDNS_I2C_IXR_SLAVE_INTR_MASK,
> +				  CDNS_I2C_IER_OFFSET);
> +		break;
> +	}
> +}
> +
> +static void cdns_i2c_slave_rcv_data(struct cdns_i2c *id)
> +{
> +	u8 bytes;
> +	unsigned char data;
> +
> +	/* Prepare backend for data reception */
> +	if (id->slave_state == CDNS_I2C_SLAVE_STATE_IDLE) {
> +		id->slave_state = CDNS_I2C_SLAVE_STATE_RECV;
> +		i2c_slave_event(id->slave, I2C_SLAVE_WRITE_REQUESTED, NULL);
> +	}
> +
> +	/* Fetch number of bytes to receive */
> +	bytes = cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
> +
> +	/* Read data and send to backend */
> +	while (bytes--) {
> +		data = cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);
> +		i2c_slave_event(id->slave, I2C_SLAVE_WRITE_RECEIVED, &data);
> +	}
> +}
> +
> +static void cdns_i2c_slave_send_data(struct cdns_i2c *id)
> +{
> +	u8 data;
> +
> +	/* Prepare backend for data transmission */
> +	if (id->slave_state == CDNS_I2C_SLAVE_STATE_IDLE) {
> +		id->slave_state = CDNS_I2C_SLAVE_STATE_SEND;
> +		i2c_slave_event(id->slave, I2C_SLAVE_READ_REQUESTED, &data);
> +	} else {
> +		i2c_slave_event(id->slave, I2C_SLAVE_READ_PROCESSED, &data);
> +	}
> +
> +	/* Send data over bus */
> +	cdns_i2c_writereg(data, CDNS_I2C_DATA_OFFSET);
> +}
> +
>  /**
> - * cdns_i2c_isr - Interrupt handler for the I2C device
> - * @irq:	irq number for the I2C device
> - * @ptr:	void pointer to cdns_i2c structure
> + * cdns_i2c_slave_isr - Interrupt handler for the I2C device in slave role
> + * @ptr:       Pointer to I2C device private data
> + *
> + * This function handles the data interrupt and transfer complete interrupt of
> + * the I2C device in slave role.
> + *
> + * Return: IRQ_HANDLED always
> + */
> +static irqreturn_t cdns_i2c_slave_isr(void *ptr)
> +{
> +	struct cdns_i2c *id = ptr;
> +	unsigned int isr_status, i2c_status;
> +
> +	/* Fetch the interrupt status */
> +	isr_status = cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
> +	cdns_i2c_writereg(isr_status, CDNS_I2C_ISR_OFFSET);
> +
> +	/* Ignore masked interrupts */
> +	isr_status &= ~cdns_i2c_readreg(CDNS_I2C_IMR_OFFSET);
> +
> +	/* Fetch transfer mode (send/receive) */
> +	i2c_status = cdns_i2c_readreg(CDNS_I2C_SR_OFFSET);
> +
> +	/* Handle data send/receive */
> +	if (i2c_status & CDNS_I2C_SR_RXRW) {
> +		/* Send data to master */
> +		if (isr_status & CDNS_I2C_IXR_DATA)
> +			cdns_i2c_slave_send_data(id);
> +
> +		if (isr_status & CDNS_I2C_IXR_COMP) {
> +			id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
> +			i2c_slave_event(id->slave, I2C_SLAVE_STOP, NULL);
> +		}
> +	} else {
> +		/* Receive data from master */
> +		if (isr_status & CDNS_I2C_IXR_DATA)
> +			cdns_i2c_slave_rcv_data(id);
> +
> +		if (isr_status & CDNS_I2C_IXR_COMP) {
> +			cdns_i2c_slave_rcv_data(id);
> +			id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
> +			i2c_slave_event(id->slave, I2C_SLAVE_STOP, NULL);
> +		}
> +	}
> +
> +	/* Master indicated xfer stop or fifo underflow/overflow */
> +	if (isr_status & (CDNS_I2C_IXR_NACK | CDNS_I2C_IXR_RX_OVF |
> +			  CDNS_I2C_IXR_RX_UNF | CDNS_I2C_IXR_TX_OVF)) {
> +		id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
> +		i2c_slave_event(id->slave, I2C_SLAVE_STOP, NULL);
> +		cdns_i2c_writereg(CDNS_I2C_CR_CLR_FIFO, CDNS_I2C_CR_OFFSET);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +#endif
> +
> +/**
> + * cdns_i2c_master_isr - Interrupt handler for the I2C device in master role
> + * @ptr:       Pointer to I2C device private data
>   *
>   * This function handles the data interrupt, transfer complete interrupt and
> - * the error interrupts of the I2C device.
> + * the error interrupts of the I2C device in master role.
>   *
>   * Return: IRQ_HANDLED always
>   */
> -static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
> +static irqreturn_t cdns_i2c_master_isr(void *ptr)
>  {
>  	unsigned int isr_status, avail_bytes, updatetx;
>  	unsigned int bytes_to_send;
> @@ -352,6 +543,27 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
>  	return status;
>  }
>  
> +/**
> + * cdns_i2c_isr - Interrupt handler for the I2C device
> + * @irq:	irq number for the I2C device
> + * @ptr:	void pointer to cdns_i2c structure
> + *
> + * This function passes the control to slave/master based on current role of
> + * i2c controller.
> + *
> + * Return: IRQ_HANDLED always
> + */
> +static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
> +{
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	struct cdns_i2c *id = ptr;
> +
> +	if (id->dev_mode == CDNS_I2C_MODE_SLAVE)
> +		return cdns_i2c_slave_isr(ptr);
> +#endif
> +	return cdns_i2c_master_isr(ptr);
> +}
> +
>  /**
>   * cdns_i2c_mrecv - Prepare and start a master receive operation
>   * @id:		pointer to the i2c device structure
> @@ -572,10 +784,28 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	u32 reg;
>  	struct cdns_i2c *id = adap->algo_data;
>  	bool hold_quirk;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	bool change_role = false;
> +#endif
>  
>  	ret = pm_runtime_get_sync(id->dev);
>  	if (ret < 0)
>  		return ret;
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* Check i2c operating mode and switch if possible */
> +	if (id->dev_mode == CDNS_I2C_MODE_SLAVE) {
> +		if (id->slave_state != CDNS_I2C_SLAVE_STATE_IDLE)
> +			return -EAGAIN;
> +
> +		/* Set mode to master */
> +		cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);
> +
> +		/* Mark flag to change role once xfer is completed */
> +		change_role = true;
> +	}
> +#endif
> +
>  	/* Check if the bus is free */
>  	if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA) {
>  		ret = -EAGAIN;
> @@ -634,7 +864,15 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	}
>  
>  	ret = num;
> +
>  out:
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* Switch i2c mode to slave */
> +	if (change_role)
> +		cdns_i2c_set_mode(CDNS_I2C_MODE_SLAVE, id);
> +#endif
> +
>  	pm_runtime_mark_last_busy(id->dev);
>  	pm_runtime_put_autosuspend(id->dev);
>  	return ret;
> @@ -648,14 +886,67 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   */
>  static u32 cdns_i2c_func(struct i2c_adapter *adap)
>  {
> -	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
> -		(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
> -		I2C_FUNC_SMBUS_BLOCK_DATA;
> +	u32 func = I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
> +			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
> +			I2C_FUNC_SMBUS_BLOCK_DATA;
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	func |= I2C_FUNC_SLAVE;
> +#endif
> +
> +	return func;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int cdns_reg_slave(struct i2c_client *slave)
> +{
> +	int ret;
> +	struct cdns_i2c *id = container_of(slave->adapter, struct cdns_i2c,
> +									adap);
> +
> +	if (id->slave)
> +		return -EBUSY;
> +
> +	if (slave->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	ret = pm_runtime_get_sync(id->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Store slave information */
> +	id->slave = slave;
> +
> +	/* Enable I2C slave */
> +	cdns_i2c_set_mode(CDNS_I2C_MODE_SLAVE, id);
> +
> +	return 0;
> +}
> +
> +static int cdns_unreg_slave(struct i2c_client *slave)
> +{
> +	struct cdns_i2c *id = container_of(slave->adapter, struct cdns_i2c,
> +									adap);
> +
> +	pm_runtime_put(id->dev);
> +
> +	/* Remove slave information */
> +	id->slave = NULL;
> +
> +	/* Enable I2C master */
> +	cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);
> +
> +	return 0;
>  }
> +#endif
>  
>  static const struct i2c_algorithm cdns_i2c_algo = {
>  	.master_xfer	= cdns_i2c_master_xfer,
>  	.functionality	= cdns_i2c_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave	= cdns_reg_slave,
> +	.unreg_slave	= cdns_unreg_slave,
> +#endif
>  };
>  
>  /**
> @@ -750,6 +1041,8 @@ static int cdns_i2c_setclk(unsigned long clk_in, struct cdns_i2c *id)
>  	ctrl_reg |= ((div_a << CDNS_I2C_CR_DIVA_SHIFT) |
>  			(div_b << CDNS_I2C_CR_DIVB_SHIFT));
>  	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
> +	id->ctrl_reg_diva_divb = ctrl_reg & (CDNS_I2C_CR_DIVA_MASK |
> +				 CDNS_I2C_CR_DIVB_MASK);
>  
>  	return 0;
>  }
> @@ -943,8 +1236,12 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  	if (ret || (id->i2c_clk > CDNS_I2C_SPEED_MAX))
>  		id->i2c_clk = CDNS_I2C_SPEED_DEFAULT;
>  
> -	cdns_i2c_writereg(CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS,
> -			  CDNS_I2C_CR_OFFSET);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* Set initial mode to master */
> +	id->dev_mode = CDNS_I2C_MODE_MASTER;
> +	id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
> +#endif
> +	cdns_i2c_writereg(CDNS_I2C_CR_MASTER_EN_MASK, CDNS_I2C_CR_OFFSET);
>  
>  	ret = cdns_i2c_setclk(id->input_clk, id);
>  	if (ret) {
> 

Shubhrajyoti: Please take a look at this one and discussion around.

Thanks,
Michal
