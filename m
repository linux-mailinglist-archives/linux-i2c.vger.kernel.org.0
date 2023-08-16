Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C36677DAC3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 09:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242226AbjHPG7v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 02:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242228AbjHPG7S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 02:59:18 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72A61BCC;
        Tue, 15 Aug 2023 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=Rx9CxpHQGsFLRIk06FX4JQQY4520UTRT/fQlsa07mE8=;
        b=VfguSBkIj+wKhT2hmYK2+QqmU9codjBV100eqIkscMppCmqXVTknYL8J8hknetzpIZx1ag9bFjc
        th2G/Olo6O8mE7ZovaC3w+MSTLRZyONUM63jJilVWmv03MPIl202nVxlMHyyM1/cd+BltSrKPE8GL
        FmoQ3iBs21RtTl++SiXAd+3nrrS2g8XkWaNjfXI+8XC+Hv03uFgsFrCnfTawD38nskmKdYI/6liTq
        Aiinv1ZohYjWMOPNAkKYdnVd87t4Qu+V1Jxa9VRcPoT7Gi9ZWJceoL+7d7w2HOtklzCMrxfEwkIjO
        QCUJLPWRWib10DygtLQwkrOUEXsGmh2iyeMw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qWAUr-00005M-KI; Wed, 16 Aug 2023 08:59:13 +0200
Received: from [2a06:4004:10df:0:1cda:5a2e:6344:82ff] (helo=smtpclient.apple)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qWAUr-000SpN-5s; Wed, 16 Aug 2023 08:59:13 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230726212132.vylu6qulpyu5fndh@intel.intel>
Date:   Wed, 16 Aug 2023 08:59:02 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <07544E8E-6C08-40F0-984B-738A69DC686F@geanix.com>
References: <20230718105435.2641207-1-sean@geanix.com>
 <20230726212132.vylu6qulpyu5fndh@intel.intel>
To:     Andi Shyti <andi.shyti@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27001/Tue Aug 15 09:40:17 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for the review

> On 26 Jul 2023, at 23.21, Andi Shyti <andi.shyti@kernel.org> wrote:
>=20
> Hi Sean,
>=20
> [...]
>=20
>> @@ -905,38 +906,43 @@ static void stm32f7_i2c_xfer_msg(struct =
stm32f7_i2c_dev *i2c_dev,
>> cr2 |=3D STM32F7_I2C_CR2_NBYTES(f7_msg->count);
>> }
>>=20
>> - /* Enable NACK, STOP, error and transfer complete interrupts */
>> - cr1 |=3D STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
>> - STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
>> -
>> - /* Clear DMA req and TX/RX interrupt */
>> - cr1 &=3D ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
>> - STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
>> -
>> - /* Configure DMA or enable RX/TX interrupt */
>> - i2c_dev->use_dma =3D false;
>> - if (i2c_dev->dma && f7_msg->count >=3D STM32F7_I2C_DMA_LEN_MIN) {
>> - ret =3D stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
>> -      msg->flags & I2C_M_RD,
>> -      f7_msg->count, f7_msg->buf,
>> -      stm32f7_i2c_dma_callback,
>> -      i2c_dev);
>> - if (!ret)
>> - i2c_dev->use_dma =3D true;
>> - else
>> - dev_warn(i2c_dev->dev, "can't use DMA\n");
>> - }
>> + if (!i2c_dev->atomic) {
>> + /* Enable NACK, STOP, error and transfer complete interrupts */
>> + cr1 |=3D STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
>> + STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
>> +
>> + /* Clear DMA req and TX/RX interrupt */
>> + cr1 &=3D ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
>> + STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
>> +
>> + /* Configure DMA or enable RX/TX interrupt */
>> + i2c_dev->use_dma =3D false;
>> + if (i2c_dev->dma && f7_msg->count >=3D STM32F7_I2C_DMA_LEN_MIN) {
>> + ret =3D stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
>> + msg->flags & I2C_M_RD,
>> + f7_msg->count, f7_msg->buf,
>> + stm32f7_i2c_dma_callback,
>> + i2c_dev);
>> + if (!ret)
>> + i2c_dev->use_dma =3D true;
>> + else
>> + dev_warn(i2c_dev->dev, "can't use DMA\n");
>> + }
>>=20
>> - if (!i2c_dev->use_dma) {
>> - if (msg->flags & I2C_M_RD)
>> - cr1 |=3D STM32F7_I2C_CR1_RXIE;
>> - else
>> - cr1 |=3D STM32F7_I2C_CR1_TXIE;
>> + if (!i2c_dev->use_dma) {
>> + if (msg->flags & I2C_M_RD)
>> + cr1 |=3D STM32F7_I2C_CR1_RXIE;
>> + else
>> + cr1 |=3D STM32F7_I2C_CR1_TXIE;
>> + } else {
>> + if (msg->flags & I2C_M_RD)
>> + cr1 |=3D STM32F7_I2C_CR1_RXDMAEN;
>> + else
>> + cr1 |=3D STM32F7_I2C_CR1_TXDMAEN;
>> + }
>> } else {
>> - if (msg->flags & I2C_M_RD)
>> - cr1 |=3D STM32F7_I2C_CR1_RXDMAEN;
>> - else
>> - cr1 |=3D STM32F7_I2C_CR1_TXDMAEN;
>> + /* Disable all interrupts */
>> + cr1 &=3D ~STM32F7_I2C_ALL_IRQ_MASK;
>=20
> if you do
>=20
> if (i2c_dev->atomic) {
> /* Disable all interrupts */
> cr1 &=3D ~STM32F7_I2C_ALL_IRQ_MASK;
> return;
> }
>=20
> you save all the above from a leveel of indentation.

Agree, it would be best not to indent this.
But the last step in the function is to write the cr1 value :) Goto =
doesn=E2=80=99t seem very pretty, but up to you...


>=20
>> }
>>=20
>> /* Configure Start/Repeated Start */
>> @@ -1670,7 +1676,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int =
irq, void *data)
>> return IRQ_HANDLED;
>> }
>>=20

[ =E2=80=A6 ]

>> - time_left =3D wait_for_completion_timeout(&i2c_dev->complete,
>> - i2c_dev->adap.timeout);
>> + if (!i2c_dev->atomic) {
>> + time_left =3D wait_for_completion_timeout(&i2c_dev->complete,
>> + i2c_dev->adap.timeout);
>> + } else {
>> + time_left =3D stm32f7_i2c_wait_polling(i2c_dev);
>> + }
>=20
> please, drop the brackets here... and time_left here serves only
> not to get the -ETIMEDOUT... looks a bit ugly to me, but can't
> think of a better way.

Done.

>=20
>> +
>> ret =3D f7_msg->result;
>> if (ret) {
>> if (i2c_dev->use_dma)
>> @@ -1727,6 +1753,24 @@ static int stm32f7_i2c_xfer(struct i2c_adapter =
*i2c_adap,
>> return (ret < 0) ? ret : num;
>> }
>>=20
>> +static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>> +    struct i2c_msg msgs[], int num)
>> +{
>> + struct stm32f7_i2c_dev *i2c_dev =3D i2c_get_adapdata(i2c_adap);
>> +
>> + i2c_dev->atomic =3D 0;
>=20
> false
>=20
>> + return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
>> +}
>> +
>> +static int stm32f7_i2c_xfer_atomic(struct i2c_adapter *i2c_adap,
>> +    struct i2c_msg msgs[], int num)
>> +{
>> + struct stm32f7_i2c_dev *i2c_dev =3D i2c_get_adapdata(i2c_adap);
>> +
>> + i2c_dev->atomic =3D 1;
>=20
> true
>=20
> Andi

/Sean=
