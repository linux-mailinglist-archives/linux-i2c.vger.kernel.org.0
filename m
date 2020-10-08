Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3600F2872BB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 12:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729569AbgJHKqT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 06:46:19 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:22153 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729562AbgJHKqP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 06:46:15 -0400
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 397652007F74
        for <linux-i2c@vger.kernel.org>; Thu,  8 Oct 2020 10:46:13 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech header.b="M/b+CvGi"
Date:   Thu, 08 Oct 2020 10:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602153968;
        bh=4NpRlPMJu+nTJ3BKK9VVYitJouPdmM13RaANueWkDgQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=M/b+CvGihVDhlxXveZ6bFw8LtfVyCrMfp5EQWimoFjBHy9QeS0/AVh9n4yQYnqkQr
         kWaMjO9Xjlg3TnUtt+onWkCCp/wbn1PzQnRqMGSR+CZg0+8sezo6Z5tdRifOilEg4m
         KAPVi5jBX6OFFiQg4M7GHSLU51+Nmk5/L7UJiQeQ=
To:     Wolfram Sang <wsa@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the oneplus6
Message-ID: <27ffa058-c800-4ce7-4db5-8896ad136abf@connolly.tech>
In-Reply-To: <20201008100352.GF76290@ninjato>
References: <20201007174736.292968-1-caleb@connolly.tech> <20201007174736.292968-6-caleb@connolly.tech> <20201008100352.GF76290@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-10-08 11:03, Wolfram Sang wrote:
> On Wed, Oct 07, 2020 at 05:49:35PM +0000, Caleb Connolly wrote:
>> The OnePlus 6/T has the same issues as the c630 causing a crash when DMA
>> is used for i2c, so disable it.
>>
>> https://patchwork.kernel.org/patch/11133827/
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> May I ask for a quick review here, so we can get this into 5.9 if
> qcom-geni maintainers agree this is good to go?

Sorry it wasn't mentioned in my first message, this patch depends on the=20
rest in the series found here:=20
https://lore.kernel.org/linux-arm-msm/20201007174736.292968-1-caleb@connoll=
y.tech/#r

>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c=
-qcom-geni.c
>> index dead5db3315a..50a0674a6553 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -358,7 +358,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>>   =09struct geni_se *se =3D &gi2c->se;
>>   =09size_t len =3D msg->len;
>>  =20
>> -=09if (!of_machine_is_compatible("lenovo,yoga-c630"))
>> +=09if (!of_machine_is_compatible("lenovo,yoga-c630") &&
>> +=09    !of_machine_is_compatible("oneplus,oneplus6"))
>>   =09=09dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
>>  =20
>>   =09if (dma_buf)
>> @@ -400,7 +401,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>>   =09struct geni_se *se =3D &gi2c->se;
>>   =09size_t len =3D msg->len;
>>  =20
>> -=09if (!of_machine_is_compatible("lenovo,yoga-c630"))
>> +=09if (!of_machine_is_compatible("lenovo,yoga-c630") &&
>> +=09    !of_machine_is_compatible("oneplus,oneplus6"))
>>   =09=09dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
>>  =20
>>   =09if (dma_buf)
>> --=20
>> 2.28.0
>>
>>


