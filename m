Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEA62F3ACA
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 20:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392989AbhALTl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 14:41:59 -0500
Received: from www.zeus03.de ([194.117.254.33]:54896 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392184AbhALTl7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 14:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=t9XstqtRgrmC0ix2FNPF67k/oNnC
        JJETaagxYwsHmRE=; b=JaDwonS5UZRK77cksg6+5d/q9duNxG5p8d/FLbtvV5Jz
        Y11V37KBxCcFyOIRxpCpqbZGfkXY2gaNCCw9HRKhFs1MPFOMTmVvzOaNdakd4Mk7
        IgSrnsvZutal1lQmf4tTxEBWeXikHBnx8DOQa5A0yj8cbSM4BwT8dJpQDy2GVLY=
Received: (qmail 2864404 invoked from network); 12 Jan 2021 20:41:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 20:41:17 +0100
X-UD-Smtp-Session: l3s3148p1@ZZq9NLm4qNMgAwDPXwxzAHrEwO71dOp2
Date:   Tue, 12 Jan 2021 20:41:16 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] media: i2c: adv7842: remove open coded version
 of SMBus block read
Message-ID: <20210112194116.GA50007@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static int adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
>  {
>  	struct adv7511_state *state = get_adv7511_state(sd);
> +	s32 len;

And 'len' here shadows the function argument :( Ok, I need to resend
this patch. Still, looking forward to a comment if an approach like this
is acceptable.


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/9+1gACgkQFA3kzBSg
KbZFzhAAh2Wa1O3n+/gpFeJusi6JllSei7zH9E2v/pWihrudzMC/FhEp4uPzMDOt
/w9b9ZLzGTZSxx38qyOdZgJBtib6liZQt6Zgsdrbh0kIRvmXDQNxpx8KZa/1ukZy
0ze1WghkEI1Jalop1FNnbzRVSBctb/lOCWevcwyQ7fbHca5OeLM8Hj2HHQahH+WU
s6UMddJAr+f7eOCc1eoc2kSjzQWQUexfNMoaYLvUZZdGTb87dd07mZlcoNgvBoeC
aM9zzBJUhALDOMioMVZujVc8kWerGF3MSPrT3uglbkGR+cdwo8GNQmoAMhgHRNi9
U2pHugFL7Oi58skehzpFDuJjqDyIpaX11U7VkrU214tEJOKo4avt+XCjpgoKzFaA
ZYGUoI1I2JQTo7CEz/Akd/vgSi+umhRAm+GTAhPy+I8q4eJaJagR38iC5zdfYW+a
S5SsHpGG31BOkIiI7heqa66W7H7B8PuCTie+QzF2rlBFJ3JlzgyuJQpTfx7p4Ths
Z7dCq2XHyyZiFyqaoRHaIKR5L+oGYfxA5U5nVYjn8hAFIkis+pMwi57VK+Kw5l/m
GLiTtNjbdRFcB3syxsbdtVSMacohOZl4nIdZhwxRbEpTq9UDTiQNFDVkDXwCw9bB
7ilk+AoO1gTNaVSEm+xPhzj/l5p7Ez0bgkp00ACEwOUEexu7gG4=
=qSVB
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
