Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEF84AD4A3
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 10:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbiBHJUO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 04:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354016AbiBHJUN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:20:13 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA364C03FEC3;
        Tue,  8 Feb 2022 01:20:11 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id g10so2654479vss.1;
        Tue, 08 Feb 2022 01:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IsxjoP7D0JFlHRawVknBmQmssNByR8ykkS34KlJR9Ug=;
        b=hY3yxNw5V2Q0s6euF504osT3pX+liIS2BJNxzAJ075fP32VFzJ8oXEDKorc2+Qa4I9
         aFLlwp1J99Id23Rwj0v3X9hv6TJwE98SoAEdGPddY7O1kMQUHe4yvf8RG/I/blbkOIx4
         ilAQ1974Cq3XmQ0bvI50vD8UWms321lgwrD6NZHeDH0QPBhokLGihD8bdQu1OH9dQoSk
         IsPORYsrodA0VrFvkrCfY8HdyV2dhPKR1aSwiOATKytPrtarjdesp0OZcwQsjUzUuIue
         NBoDomeK/Bp9lVmhnRj30eZohLM2fHD/TtEdw6waNhEuLrtKstDi+gKFCz6lnmArUfeU
         ENKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IsxjoP7D0JFlHRawVknBmQmssNByR8ykkS34KlJR9Ug=;
        b=3hL/bHXbFjO3Ei9TSWDgtEK4PdaiDRSv599mePt5rS8tYdLe07xVu0ErO7mFJ0y49m
         M5NZCvVola9niyeMoSQWVR/jMO6EE3r/UCFIseqjoyCZtzhHlXns/0yBfldv3S5P8HvN
         marv4ua9Vo1hBPOBC5lS++Cchri3oO6Ko0rc3CpexvV/E3k0d5z63/4fvyGD8mGxLeel
         MnEYPha5M7cpd4PuE/alHYzSkwtpkYGAWKXcL/483ZOIbGc0wFW1hTJ9AfmvOkcR6XTR
         F073WLmPsiNvbi2g0yXcCbYwDmgUFQMIdBY6lQml1AGbDO5zAOFtXyw3siAhBOt2w5YS
         BIUw==
X-Gm-Message-State: AOAM532dgMBwU7I75bdyJ2zgoO6bP2O/eUnp2A2YQZOY3QZB9BERcQ4i
        paaPqu8ChkVMFiaH9nzJHDFqmjZHM1+Ie3FQOf5HQqjBlpDZ
X-Google-Smtp-Source: ABdhPJwlI5Bnjj85YTfbCpu/tslPPwok+IfxHdXBGd6lKJKMJxG7q3dFPrV88ZNxXc0DKsRUS/PtvucmHm0zcATjie0=
X-Received: by 2002:a05:6102:5114:: with SMTP id bm20mr1237107vsb.47.1644312010745;
 Tue, 08 Feb 2022 01:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-5-warp5tw@gmail.com>
 <YgEFIOdlp/t9ezR5@latitude>
In-Reply-To: <YgEFIOdlp/t9ezR5@latitude>
From:   warp5tw <warp5tw@gmail.com>
Date:   Tue, 8 Feb 2022 17:19:58 +0800
Message-ID: <CACD3sJapCpG9qg6u6DwNmmfEfuBp6KsxTBtn7WJodXP61Jsgtw@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] i2c: npcm: Handle spurious interrupts
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, sven@svenpeter.dev, bence98@sch.bme.hu,
        lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000004d098405d77e39eb"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000004d098405d77e39eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan:

Thank you for your comments.

Regards,
Tyrone

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=887=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:40=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Hello,
> some comments below.
>
> On Mon, Feb 07, 2022 at 02:33:36PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > In order to better handle spurious interrupts:
> > 1. Disable incoming interrupts in master only mode.
> > 2. Clear EOB after every interrupt.
>
> For those who rarely deal with this particular I2C controller, please
> add the meaning of EOB, e.g.: "2. Clear end of busy (EOB) after every int=
errupt"
>

Okay, it will be addressed.

> > 3. Return correct status during interrupt.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 96 +++++++++++++++++++++-----------
> >  1 file changed, 65 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 5c22e69afe34..1ddf309b91a3 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_=
adap)
> >  {
> >       struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, ada=
p);
> >
> > -     return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> > +     return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
> >  }
> >
> >  static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
> >  {
> >       struct npcm_i2c *bus =3D container_of(_adap, struct npcm_i2c, ada=
p);
> >
> > -     return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> > +     return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
> >  }
>
> This change seems unrelated and isn't mentioned in the commit message.
> Please remove it or put it into a separate commit, or document the
> motivation in the commit message.
>

Okay, it will be addressed.

>
> >
> >  static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
> > @@ -564,6 +564,15 @@ static inline void npcm_i2c_nack(struct npcm_i2c *=
bus)
> >       iowrite8(val, bus->reg + NPCM_I2CCTL1);
> >  }
> >
> > +static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
> > +{
> > +     u8 val;
> > +
> > +     /* Clear NEGACK, STASTR and BER bits */
> > +     val =3D NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
> > +     iowrite8(val, bus->reg + NPCM_I2CST);
>
> Small nitpick: Please keep the order the same between comment and code,
> e.g.:
>
>         /* Clear BER, NEGACK and STASTR bits */
>         val =3D NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
>
>
>
> Best regards,
> Jonathan

--0000000000004d098405d77e39eb
Content-Type: text/plain; charset="US-ASCII"; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
Content-ID: <17ed89be4ed61a8e03b2>
X-Attachment-Id: 17ed89be4ed61a8e03b2

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFJekJBQUJDZ0FkRmlFRXZIQUhHQkJq
UVBWeStxdkRDREJFbW83elg5c0ZBbUlCQlA4QUNna1FDREJFbW83eg0KWDlzckx3LzlGazBEd3Yz
T3V0SlduZ1FqQnVjVzdLV3phZHJweHNNc2VzeUtuZTBCdmFaVU43RGN3NVpzYTlseg0Kdng5L3hS
OEcvK0tRTnhjUEZFVHFoSHpDcDlEMkRMVy9xVG5pQXZvY0ErbUFDWFBYUks3eUE5K0wybThVNThQ
Uw0KUXVLRDFOVkN0WFhGemlMcis0dFQ2M3hJMTNpMjhEOEg5Sm8xZlRkK25QWmdtbk1lSUZmTmNE
T2VWT2ROQlY1Nw0Kb3ZmSkdaekZHU0dSN1Jvc010a25oZi92eEl6THV1NGxScUVDck9SRmxHVVZX
aTJwT2doY0VscmRnWTNnODlDTw0KRnI3dXJkcWtiN09IbUdZK0o5dHZiSVhDK2ZwQTVXK0xPbExx
MkMreCtxSmYyMlQyTUs5SndCOW11WTdESm92Kw0KNnl3enFVcVFEYlBWVzVSN2lYb04wVkdYU3ZW
ZHp3UlY3eFFtMEwzZ2RRZWlVTkFrQzZVa2lDUHRTZ1Q5S0FsbQ0Kc1FDa1R2U1ZVaFAxVm8zdTZq
bnAya3FuejhyN3Y4RWdFZFBRMFFrTjJYUzhsdXAxeGxCbm1YVTk1Zmx6Z0pBag0KYXNkMWo1eUI1
c01rSW9td3Vnbk1WWkxwUWFVVkhFcGxzNUFDYUpYazVubUdXYjN5bUFTTzQ4Nm42ZDFVK0JpVw0K
RWRhVG9obkxSRDVOTVh1SnZ0R0l1Q2I2eVpWMmdnYzVsMWNIUi82ZGVXcDhacmUyQ2lKN1JFTGlJ
cjVCbHIxaw0KQmZETG9TOElDT3JBREFmUGFvVllWZmh0SGRqdytkaWNPNjdKQThYTUlYRzE3OUx6
ZzdDWTl5eW12dGsvSGVBOA0KL2hJQTZzTW4xTStQUUxBbjBIZ0tmby9mVGFKMDFDdWxqUVl6N3Vk
NEpkS3hrZitMVFlZPQ0KPS8zN0INCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0K
--0000000000004d098405d77e39eb--
