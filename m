Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFAA97E52D8
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235374AbjKHJuM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHJuL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:50:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF681B3
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 01:50:09 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6DBC433C8;
        Wed,  8 Nov 2023 09:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699437009;
        bh=7KX/N9aPy9zdQF1Zov6XdI1SPo5oiHNimolpbdVnVnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HSYWb2b5WLahadN6wM7sb4QmG1k7xQK7Mkob/KOpX9hHB4P4cmmp06hpIrxCSofjI
         1zQeyfEFKHxcY5GaxyZt/UIY27wot5eSPQgGyqcSbZSNtzdR7cMrqjqfgurJ9CQCcn
         wRbv9WdB9OB3E85hRKvdTI05PwpGxR0NCGBD4AbtHnkclDwT4cWTcIhKJbVB/y4Mov
         Xv93URGMqLoXtoGKkWYOu8UJEdb+lB2Z7UgBUkWh8IakYR6ADHwDOnr4Pdd/fcqTqJ
         rCApYyzlz1+0DtJ1tNHLuQq6SqZa3qg2U9LVlMWJuBS0rIioMMY3UbavQX26hiMpGh
         7uw9Yzz7FlsvQ==
Date:   Wed, 8 Nov 2023 10:50:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        cobechen@zhaoxin.com
Subject: Re: [PATCH v3 00/12] i2c: add zhaoxin i2c controller driver
Message-ID: <ZUtZzlHd2f6XoTVk@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YABNHV3zRN6Fhun7"
Content-Disposition: inline
In-Reply-To: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YABNHV3zRN6Fhun7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> Due to some corporate and personal delays, I only recently had time

Don't worry, we are glad that you are back.

> to prepare the patch v3. Please kindly review.

Yes, I will have a look, hopefully soon after the merge window is over.
Really cool to see this new version. Most people drop off when I ask
them to refactor their new driver to an existing one. But you made it,
awesome!

All the best,

   Wolfram


--YABNHV3zRN6Fhun7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVLWcoACgkQFA3kzBSg
Kba+sw//RlYf+vp0oxnLtfey63G91flIacADSrlNfshpUlRAMStzy6q+LCnZ/A3+
FXCRG9EklAuAxIArFyGml4PSjEhOrKzKgd0NmBU4wM7Fs5iK0z0NCJT2F+LDPjCV
L4p/zgDfDEfFmj/HCr7qRQmApWXXZ+mB6JBvAoMdL85Dm7/oSu7HVDMLtYyvTyQF
9L/li4ruuMpII7dPbKggvhVfTKWG5jpqacR7Q9KItX00Tq1e+cbs7E3W10HhCB/5
g03QQlwYkDbuv+5xrzZgn9dIoqEmoc4Swz4XhDOughv5OVrFYU0hH7E2GU6I4uW8
n9otGzLTtm7g8fZ0arrs0S+dGMOFaugSZ41d6z9k9X+mIKDTestJjIVk8TH7V995
8eepTeAMM2rTb1MlB+OEFxnsDzEkeD+3wI9qye7Y1m85d+W8grvBV+8/UKAwdUMO
H7+ztBdMHYcrH7L5JYue1hXkb+idlRUMo8Ps/1u2JVdsu+nki70K+PJLlzqf9dQq
qdmetTl0zdOkdnxVOULTbh55oKlNynDEGDA59igAtE088hJTocJhldfUdzDt70Wg
zVp4LcWNB3nwftl3Sd5bjXl+Wz14fs9TzUv7M48kPKpqpcfJnqy7rsE+7lPWmhtE
NMYFeNqo/y3qjS7VDWj84ZqJh/gbYLmt4JiAgZi0fZxctAkxdMY=
=LTjj
-----END PGP SIGNATURE-----

--YABNHV3zRN6Fhun7--
