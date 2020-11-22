Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE6C2BC79F
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Nov 2020 19:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgKVR7w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Nov 2020 12:59:52 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:42922 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbgKVR7v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Nov 2020 12:59:51 -0500
Date:   Sun, 22 Nov 2020 17:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1606067987;
        bh=0tDIIuf1Tt9UO5w2d7UPKWMd7FZ0ye8L9YX/ZJ0uO48=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=N9wfKYz9xQLTcAPvtTX7NH1mNJcxIOInJfKomsHFIQ6O4eZjlNIfHWG2cyw0hNIti
         gPNQoCZ0l10nk9fpcdC46Ob7SMUr6JYkC6GU2aH18O8fzIpTCxcNVsnqbpmbslZR9i
         n2v/z/qSRtJbnDTuG2b0X2jbSxTkzQdXak+buDYw=
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6 devices
Message-ID: <72a37c8c-12e4-eb51-2644-3436d19cf314@connolly.tech>
In-Reply-To: <20201122034709.GA95182@builder.lan>
References: <20201112161920.2671430-1-caleb@connolly.tech> <20201112161920.2671430-6-caleb@connolly.tech> <20201122034709.GA95182@builder.lan>
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

Hi Bjorn,

It looks like I still have the same issue even with this patch applied.

Regards,
Caleb

On 2020-11-22 03:47, Bjorn Andersson wrote:
> On Thu 12 Nov 10:22 CST 2020, Caleb Connolly wrote:
>
>> The OnePlus 6/T has the same issue as the Yoga c630 causing a crash when=
 DMA
>> is used for i2c, so disable it.
>>
>> https://patchwork.kernel.org/patch/11133827/
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c=
-qcom-geni.c
>> index 8b4c35f47a70..9acdcfe73be2 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -357,7 +357,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>>   =09struct geni_se *se =3D &gi2c->se;
>>   =09size_t len =3D msg->len;
>>
>> -=09if (!of_machine_is_compatible("lenovo,yoga-c630"))
>> +=09if (!of_machine_is_compatible("lenovo,yoga-c630") &&
>> +=09    !of_machine_is_compatible("oneplus,oneplus6"))
> This hack seems to have been working around two separate issues. First
> with iommu active the GENI wrappers needs to have their stream mapping
> configured. Secondly there was a bug in the transaction setup that was
> recently fixed by Doug Anderson.
>
> So can you please give the following patch a go? I've yet to test it on
> the Lenovo machine, but I think it allows us to remove the quirk.
>
> https://lore.kernel.org/lkml/20201122034149.626045-1-bjorn.andersson@lina=
ro.org/T/#u
>
> Regards,
> Bjorn
>
>>   =09=09dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
>>
>>   =09if (dma_buf)
>> @@ -399,7 +400,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>>   =09struct geni_se *se =3D &gi2c->se;
>>   =09size_t len =3D msg->len;
>>
>> -=09if (!of_machine_is_compatible("lenovo,yoga-c630"))
>> +=09if (!of_machine_is_compatible("lenovo,yoga-c630") &&
>> +=09    !of_machine_is_compatible("oneplus,oneplus6"))
>>   =09=09dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
>>
>>   =09if (dma_buf)
>> --
>> 2.29.2
>>
>>


