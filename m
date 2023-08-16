Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB7B77DADC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 09:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242310AbjHPHDe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 03:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242308AbjHPHDI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 03:03:08 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF2530DA;
        Wed, 16 Aug 2023 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=5MhjneJemItWisEeWBJ9xqyHb/f6PYCrLEq/lmLd5KA=;
        b=J8rD/W08c+MKJzItNdHqV3pDQIwtbiAFDQVtGWBpsFI4YVZPXKJol2wVZn5ZGYmnA2prDmr2FZV
        xZ7kg/zTkbnXzNXwGZRpHVaRAoTYL8tdUXMNKwJgzgScJXh/Vo1QaKWuJs8GIi3ZUI3byRgcat9ij
        EUlRx8mVcFUMk5D4sf8UY8HVbdpbYmasAZBcr9NjXKAJP3zhGISRiplx2aCLo/hiaZXEDe3LlllLV
        zaYzVQeHF/XEIeXRTlClfxIv868r2VJi8m874o7zIJBj0wXpf0PGCZqtF0W8Uuz65tzDv3AaTgfv0
        f6wl9f9UG3gFNuooZXKROE68Pw7EoCjLeZaA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qWAY3-0000hq-QY; Wed, 16 Aug 2023 09:02:31 +0200
Received: from [2a06:4004:10df:0:1cda:5a2e:6344:82ff] (helo=smtpclient.apple)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qWAY3-000NjS-BA; Wed, 16 Aug 2023 09:02:31 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
Date:   Wed, 16 Aug 2023 09:02:20 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E10F2AD-6D7E-4F2F-ACEB-B6FD3C71C85D@geanix.com>
References: <20230718105435.2641207-1-sean@geanix.com>
 <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
To:     Alain Volmat <alain.volmat@foss.st.com>
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

Hi Alain,

Thanks for the review

> On 2 Aug 2023, at 12.07, Alain Volmat <alain.volmat@foss.st.com> =
wrote:
>=20
> Hi Sean,
>=20
> sorry for the delay for this review.  Thank you Andi for
> the review as well.

Also from my side :) Vacation.

>=20
> Few other comments in addition to what Andi already mentioned.
>=20
> On Tue, Jul 18, 2023 at 12:54:35PM +0200, Sean Nyekjaer wrote:
>> Add an atomic_xfer method to the driver so that it behaves correctly
>> when controlling a PMIC that is responsible for device shutdown.
>>=20
>> The atomic_xfer method added is similar to the one from the =
i2c-mv64xxx
>> driver. When running an atomic_xfer a bool flag in the driver data is
>> set, the interrupt is not unmasked on transfer start, and the IRQ
>> handler is manually invoked while waiting for pending transfers to
>> complete.
>>=20
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>> Changes since v1:
>> - Removed dma in atomic
>>=20
>> drivers/i2c/busses/i2c-stm32f7.c | 111 =
++++++++++++++++++++++---------
>> 1 file changed, 78 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c =
b/drivers/i2c/busses/i2c-stm32f7.c
>> index e897d9101434..d944b8f85d1c 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
>> u32 dnf_dt;
>> u32 dnf;
>> struct stm32f7_i2c_alert *alert;
>> + bool atomic;
>=20
> I am wondering if this atomic really needs to be within the struct.
> It could well be given as last arg of stm32f7_i2c_xfer_core and
> stm32f7_i2c_xfer functions.

Agree.

>=20
>=20
>> };
>>=20
>>=20

[ =E2=80=A6 ]

>> @@ -1670,7 +1676,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int =
irq, void *data)
>> return IRQ_HANDLED;
>> }
>>=20
>> -static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>> +static int stm32f7_i2c_wait_polling(struct stm32f7_i2c_dev *i2c_dev)
>> +{
>> + ktime_t timeout =3D ktime_add_ms(ktime_get(), =
i2c_dev->adap.timeout);
>> +
>> + while (ktime_compare(ktime_get(), timeout) < 0) {
>> + udelay(5);
>> + stm32f7_i2c_isr_event(0, i2c_dev);
>> +
>> + if (try_wait_for_completion(&i2c_dev->complete))
>> + return 1;
>=20
> I agree with the complete / wait_for_completion approach since it =
allows
> to keep most of code common by manually calling the isr_event for
> checking status bits.  However what about using completion_done =
instead
> of try_wait_for_completion here ? This shouldn't change much since
> anyway there is a reinit_completion at the beginning of the xfer
> function, but at least function naming feels better since not refering
> to waiting ..

I=E2=80=99ll take a look at the completion_done()

>=20
>> + }
>>=20

[ =E2=80=A6 ]

/Sean

