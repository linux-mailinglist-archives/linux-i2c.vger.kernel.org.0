Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94414EB45C
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 22:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235687AbiC2UAv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 16:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241108AbiC2UAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 16:00:50 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B9315FFE;
        Tue, 29 Mar 2022 12:59:06 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 660C65C01BB;
        Tue, 29 Mar 2022 15:59:05 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Tue, 29 Mar 2022 15:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; bh=ECeje11hlUWWc7
        ahU+melr+v3923TUV1SOEn+aMSwfc=; b=IDkyQ8wvClEa9bEVHsgEqxUSqV0Cqf
        0X7a5NoChmomd/wU1PWKAzdiPjS8DgkvrrqPi6Wv0Uta2ngB9z/OnTkK5lkyVx0q
        1u7KmRN4XcTAFWSq/SH4SBA7jOUsYsvH/VoZQt6NCJ3z4hD5abm1Z2qOHjFTUDil
        UpwTPJa4ZNACsyT38uouIFQA4nBUP+5bcJsy8XlvSA8IqWhcbOPQ5szbncCB78NC
        ZXaHGW8YBtjqX9rNqG4PN0pvyRZqPlTOuNRrpj6rntgWEaMXEyyXLoFj3pr3XwNS
        cBWpfnOPwud9JERKOCiPSNm+DA92TbRbK3iZyC0XX+AKrdvqsi6LwYtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ECeje11hlUWWc7ahU+melr+v3923TUV1SOEn+aMSw
        fc=; b=MXBIEYDu0Diu7AlV79qmpfV03zUCN1oIh30QqCzW2JH0EBCCiKmllCFjl
        FHIBVeFNemPwI9U8LbzqFRgJTWgO9ot149wgeULc9+lmBHKkMV2+Jo55eLcauOJd
        VaV1TND7gvEFTXr9vmsL0M3pjb/8diL9ECBh4QUYpHqALVeY0KBTeStCNi9rVXMb
        YR7l392wToBSdZ2rfhDFUJZMes3IlZFNrO43zIBI4prttkCZxYoVaV5lS2qdbdLT
        f47kBEaKl7ZKNtOhosOFwnliOXguDnQ/lvyFGzg7gdRxtLwLiuj60Bxb//dOFmMc
        OTLQfju6c7tMuFomfwDq2g0CANarA==
X-ME-Sender: <xms:B2VDYiEnOrERQd-p9wWp-eftG2L8MPSZqc0sLH7oVVbwJLlosE-EyA>
    <xme:B2VDYjVrTK0qZeBjRKyddoXoKpyS3KNkneLa8MjMfpjYC67AU_bOjVEr2JRyiPUrY
    ErtloDAUWU7_GRwuO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeetueduleetfeeuledvleehheeivedvhfekheejjeduhfeileffffdu
    hfekieelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:B2VDYsKbFzSBts_hisz_R4QUxzHx0zcNz3-jedNjie8uqSA22XZL6g>
    <xmx:B2VDYsEJuXuGPkiroERW54xpqXxJPkeSdKAfcHOQHU3zQKFzhrQGMQ>
    <xmx:B2VDYoVRvIT0BjVz8fpeNtd7BrIReH8gbQfIdrHryTJABYn-LINxvQ>
    <xmx:CWVDYhNPHo1q35d7aYeXWAoLtOGKsy73hJ8Z-bzeseDd6mwKB8yChQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8FE2F2740137; Tue, 29 Mar 2022 15:59:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <74a36bce-3d6e-4124-add1-8ed44ba2c80d@www.fastmail.com>
In-Reply-To: <20220329183817.21656-1-povik+lin@cutebit.org>
References: <20220329183817.21656-1-povik+lin@cutebit.org>
Date:   Tue, 29 Mar 2022 21:58:43 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        "Hector Martin" <marcan@marcan.st>,
        "Michael Ellerman" <mpe@ellerman.id.au>
Cc:     "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Paul Mackerras" <paulus@samba.org>,
        "Jean Delvare" <khali@linux-fr.org>,
        "Olof Johansson" <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Janne Grunau" <j@jannau.net>
Subject: Re: [PATCH] i2c: pasemi: Wait for write xfers to finish
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 29, 2022, at 20:38, Martin Povi=C5=A1er wrote:
> Wait for completion of write transfers before returning from the drive=
r.
> At first sight it may seem advantageous to leave write transfers queued
> for the controller to carry out on its own time, but there's a couple =
of
> issues with it:
>
>  * Driver doesn't check for FIFO space.

Maybe we should also check that in a follow-up patch :-)

>
>  * The queued writes can complete while the driver is in its I2C read
>    transfer path which means it will get confused by the raising of
>    XEN (the 'transaction ended' signal). This can cause a spurious
>    ENODATA error due to premature reading of the MRXFIFO register.
>
> Adding the wait fixes some unreliability issues with the driver. There=
's
> some efficiency cost to it (especially with pasemi_smb_waitready doing
> its polling), but that will be alleviated once the driver receives
> interrupt support.
>
> Fixes: beb58aa39e6e ("i2c: PA Semi SMBus driver")
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>

>
> Tested on Apple's t8103 chip. To my knowledge the PA Semi controller
> in its pre-Apple occurences behaves the same as far as this patch is
> concerned.
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c=20
> b/drivers/i2c/busses/i2c-pasemi-core.c
> index 7728c8460dc0..9028ffb58cc0 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -137,6 +137,12 @@ static int pasemi_i2c_xfer_msg(struct i2c_adapter=20
> *adapter,
>=20
>  		TXFIFO_WR(smbus, msg->buf[msg->len-1] |
>  			  (stop ? MTXFIFO_STOP : 0));
> +
> +		if (stop) {
> +			err =3D pasemi_smb_waitready(smbus);
> +			if (err)
> +				goto reset_out;
> +		}

Looks like pasemi_smb_xfer doesn't suffer from the same issue.
I wonder if every device connected to the bus on the original PA Semi bo=
ards
only used that path and that's why no one noticed it.


Sven

