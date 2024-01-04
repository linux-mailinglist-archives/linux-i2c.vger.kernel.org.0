Return-Path: <linux-i2c+bounces-1099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C4823A89
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 03:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E409D2882A9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 02:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748A41FC1;
	Thu,  4 Jan 2024 02:12:52 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D02E1FA1
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 02:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704334366-086e230f270fea0001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id AsuQUXM5NiMTd5FV (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 10:12:46 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:12:46 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:12:45 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <83d535cc-8211-416e-b497-eb970aff445b@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 10:12:42 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] i2c: wmt: rename with prefix VIAI2C_ and viai2c_
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v6 5/8] i2c: wmt: rename with prefix VIAI2C_ and viai2c_
To: Andi Shyti <andi.shyti@kernel.org>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <65b930cefd380ce45e0e1b3967bc7f51737b0948.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103184544.7mugspjz7cyhn7jk@zenone.zhora.eu>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240103184544.7mugspjz7cyhn7jk@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1704334366
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 4324
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118953
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2024/1/4 02:45, Andi Shyti wrote:
> Hi Hans,
>
> On Fri, Dec 29, 2023 at 02:30:36PM +0800, Hans Hu wrote:
>> Since the I2C IP of both wmt and zhaoxin come from VIA.
>> So, rename common register, function and variable's name
>> to VIAI2C_ and viai2c_.
> this commit is not really clear. Can we write something like:
>
> "The I2C IP for both wmt and zhaoxin originates from VIA. Rename
> common registers, functions, and variable names to follow the
> VIAI2C_ and viai2c_ naming conventions for consistency and
> clarity."


ok, will change this.


>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> [...]
>
>> -#define WMTI2C_REG_CR		0x00
>> -#define WMTI2C_CR_TX_NEXT_ACK		0x0000
>> -#define WMTI2C_CR_ENABLE		0x0001
>> -#define WMTI2C_CR_TX_NEXT_NO_ACK	0x0002
>> -#define WMTI2C_CR_TX_END		0x0004
>> -#define WMTI2C_CR_CPU_RDY		0x0008
>> +#define VIAI2C_REG_CR		0x00
>> +#define VIAI2C_CR_ENABLE		BIT(0)
>> +#define VIAI2C_CR_RX_END		BIT(1)
>> +#define VIAI2C_CR_TX_END		BIT(2)
>> +#define VIAI2C_CR_CPU_RDY		BIT(3)
>> +#define VIAI2C_CR_END_MASK		GENMASK(2, 1)
>>   
>>   /* REG_TCR Bit fields */
>> -#define WMTI2C_REG_TCR		0x02
>> -#define WMTI2C_TCR_STANDARD_MODE	0x0000
>> -#define WMTI2C_TCR_MASTER_WRITE		0x0000
>> -#define WMTI2C_TCR_HS_MODE		0x2000
>> -#define WMTI2C_TCR_MASTER_READ		0x4000
>> -#define WMTI2C_TCR_FAST_MODE		0x8000
>> -#define WMTI2C_TCR_SLAVE_ADDR_MASK	0x007F
>> +#define VIAI2C_REG_TCR		0x02
>> +#define VIAI2C_TCR_MASTER_WRITE		0x0000
>> +#define VIAI2C_TCR_HS_MODE		BIT(13)
>> +#define VIAI2C_TCR_MASTER_READ		BIT(14)
>> +#define VIAI2C_TCR_FAST			BIT(15)
>> +#define VIAI2C_TCR_SLAVE_ADDR_MASK	GENMASK(6, 0)
>>   
>>   /* REG_CSR Bit fields */
>> -#define WMTI2C_REG_CSR		0x04
>> -#define WMTI2C_CSR_RCV_NOT_ACK		0x0001
>> -#define WMTI2C_CSR_RCV_ACK_MASK		0x0001
>> -#define WMTI2C_CSR_READY_MASK		0x0002
>> +#define VIAI2C_REG_CSR		0x04
>> +#define VIAI2C_CSR_RCV_NOT_ACK		BIT(0)
>> +#define VIAI2C_CSR_RCV_ACK_MASK		BIT(0)
>> +#define VIAI2C_CSR_READY_MASK		BIT(1)
>>   
>>   /* REG_ISR Bit fields */
>> -#define WMTI2C_REG_ISR		0x06
>> -#define WMTI2C_ISR_NACK_ADDR		0x0001
>> -#define WMTI2C_ISR_BYTE_END		0x0002
>> -#define WMTI2C_ISR_SCL_TIMEOUT		0x0004
>> -#define WMTI2C_ISR_WRITE_ALL		0x0007
>> +#define VIAI2C_REG_ISR		0x06
>> +#define VIAI2C_ISR_NACK_ADDR		BIT(0)
>> +#define VIAI2C_ISR_BYTE_END		BIT(1)
>> +#define VIAI2C_ISR_SCL_TIMEOUT		BIT(2)
>> +#define VIAI2C_ISR_MASK_ALL		GENMASK(2, 0)
>>   
>>   /* REG_IMR Bit fields */
>> -#define WMTI2C_REG_IMR		0x08
>> -#define WMTI2C_IMR_ENABLE_ALL		0x0007
>> +#define VIAI2C_REG_IMR		0x08
>> +#define VIAI2C_IMR_BYTE			BIT(1)
>> +#define VIAI2C_IMR_ENABLE_ALL		GENMASK(2, 0)
>>   
>> -#define WMTI2C_REG_CDR		0x0A
>> -#define WMTI2C_REG_TR		0x0C
>> -#define WMTI2C_REG_MCR		0x0E
>> +#define VIAI2C_REG_CDR		0x0A
>> +#define VIAI2C_REG_TR		0x0C
>> +#define VIAI2C_REG_MCR		0x0E
> These defines have been changed twice in this series. The patches
> should be rearranged in order to avoid this.
>
> I Wolfram is not against, I'm OK with letting it slip this time.


I also realize that repetition is not good,
I only did this in the hope that patches would be easier to review.


>> -struct wmt_i2c {
>> +struct viai2c {
>>   	struct i2c_adapter	adapter;
>>   	struct completion	complete;
>>   	struct device		*dev;
>> @@ -60,7 +60,7 @@ struct wmt_i2c {
>>   	u16			cmd_status;
>>   };
>>   
>> -int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
>> -int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c);
>> +int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
>> +int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
>>   
>>   #endif
>> diff --git a/drivers/i2c/busses/i2c-wmt-plt.c b/drivers/i2c/busses/i2c-wmt-plt.c
>> index e0ffccf8a40a..8f506888cff7 100644
>> --- a/drivers/i2c/busses/i2c-wmt-plt.c
>> +++ b/drivers/i2c/busses/i2c-wmt-plt.c
>> @@ -22,13 +22,15 @@
>>   #define WMTI2C_MCR_APB_96M		7
>>   #define WMTI2C_MCR_APB_166M		12
>>   
>> +#define wmt_i2c				viai2c
> no, please, do not redefine types. Besides This looks a bit
> dangerous and reckless to me :-)


ok, will use viai2c directly.


>
> Andi

