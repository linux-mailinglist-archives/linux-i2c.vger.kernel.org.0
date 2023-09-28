Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693A27B22B7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 18:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbjI1Qri (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 12:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjI1Qrg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 12:47:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688F91A8
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 09:47:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C64C433C8;
        Thu, 28 Sep 2023 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695919652;
        bh=K7W75tKomYdS/u+fXbXHRysh13S+QTiCeERkmdXwVnM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aRNxtS44leIGuHv9x9zFoRFJroeY7IYn/L3mcAQvr2P45A3eY8USKr3ptF8JbMMhH
         qnWCWhbuRmag51BbDgxtirWBVEINXUuBry1S5U4HQHofqYDa/5T5BijBIu7FAo8N6d
         sOjbAyc4A7YTj3hsWBqk7qOKxVjD8zprqZfjY8JjsMUjnFiCrtCrhlIkveT5Ca1Ahz
         9JMVy/QfinAfgJTNNe23AifCdKcWFpp76t85PX795EDZ2dUKOZGIs0F6VYJvrEOpvC
         jE08wvmAysFOJ+WiijaaQpV6ch0bwNrn2rlod7PCwKeLxWjTtTJFteQ2iYq5LETUtR
         TzEK9yC8p/phw==
Date:   Thu, 28 Sep 2023 18:47:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <ZRWuILREQejwvM7X@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20230928101655.47d3dd2a@endymion.delvare>
 <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
 <ZRWXMRpkO3tOwW1Z@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LCXOxdkm4+m2JNxS"
Content-Disposition: inline
In-Reply-To: <ZRWXMRpkO3tOwW1Z@ninjato>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LCXOxdkm4+m2JNxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 05:09:37PM +0200, Wolfram Sang wrote:
>=20
> > I think I commented here that I had double thoughts on this. I
>=20
> Didn't you get Jean's and my reply?

I have been notified that this message could be seen as impolite. It was
*totally* not meant this way. I was really wondering if the mails didn't
get through. Such things happen, so I wanted to rule them out. It maybe
was too brief. I really appreciate Andi's effort in the I2C subsystem
and have zero bad feelings or whatsoever. So, if it sounded otherwise, I
am sorry. I try to add a few more words in the future.



--LCXOxdkm4+m2JNxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUVriAACgkQFA3kzBSg
KbZnzxAAjOe8cYRvJlS89oQz2N8VlpYNnH1gy5a5p6PVD9NirlUXixCRgoJOyK3p
E7BO4N9vHu5s8TsdKhXfKJ6hFolgrz7/TMnVlPoYjaGkbcLYVy9WEqtxCIW5HYS+
BoAf51l/AsCou0E5bzYGiCJZZLQttXk0M7YTveCKqf7j6O5WKA37uAxJfWS/vGKc
aNW2SyASBWMrLD9bpZuR5x2yTOwAiTOvyCujZC5mCx6Sx7OWmGyCxg58zJ11vwYT
zm7yrRl5RNpgjPxQ3QmLz42CbMeQ1NCxj8vep09GezKSoPSiZRm4qGAhjZ0DwwrT
P3bD4LYsFrBvP/1Z8Ax8H95/wmNXkSJu0fEcmNNy8ZXAGxBVBnsV7p91zBsTW6Ca
+SCFkcJjDdcdW/AxOoQSl+jM3PWyg0V3SaOOxUcDCpa+HW3pdRGg0iwXOD02MwtD
RlTbNTI6dNwiVrU4gpDfOAALBbG/rwR5by9/JlwHfth2+BhN4YV16bYZiHk6yFOP
5fv9KCRYxDZ7ZmujtDxISMknIrQ7hmG7nltk1jYHik6fkpbt7B+AQP7Vj35Nd953
ag9zmJIHc7m5J5Y87WKa4hRtPtSbFCiC4QQMw6X2seFQciv6siAiQHxVBRnDrPYT
YSapSIezYsp3bXmSCJWde58oEVqzaGUFGYqXPdKqKPpqUWWOak8=
=1H9H
-----END PGP SIGNATURE-----

--LCXOxdkm4+m2JNxS--
