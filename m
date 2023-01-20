Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6607467512A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjATJcJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjATJcI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:32:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40A8A2946;
        Fri, 20 Jan 2023 01:31:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DBB96B8213A;
        Fri, 20 Jan 2023 09:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B61CC433EF;
        Fri, 20 Jan 2023 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674207070;
        bh=CKOtrO4qEvfU2v7n0sOZxuyMB/iDpeXkgjzeYkeZiOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYB2WIrxqbuDQhGdXFRPx7IpEmt+OzFJpaPxSHgP6GQW3G+VBLx1f4dNvJYUftQTN
         TsKQMwt/v37982YqiGff/rqz+tL1btpZjirtUkwAjhUMz9LuUb9emTPqOL0h7t5lp1
         YIxy7GOOCTOrxQsJvRt+uEPCDgsNRUHM+uZ5jxtFuqvwANP3W65PQIc8qpw8wnBsQk
         5nZfxTaJc9kSbjUl607NKG3azOwUIsY3jJ3xF3Guisa6hrTw3QJFujtBDVAz8J3Z3e
         AIw3RiT+u+g3K5cOLDpbi/o2X04DG7p5h/0utHHtXgCgpmLUdg7RJUzPwB3N+2aO0q
         z1qBMvz2ICTXA==
Date:   Fri, 20 Jan 2023 10:31:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-mt65xx: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <Y8pfW9tr3ZxW/xl+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202301191719589508843@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7G+d9qaccbupwLTd"
Content-Disposition: inline
In-Reply-To: <202301191719589508843@zte.com.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7G+d9qaccbupwLTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:19:58PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--7G+d9qaccbupwLTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKX1sACgkQFA3kzBSg
KbZlxBAAsFG9Ww7RAqxOh6qF1WLDMNIsH1bdzLVi/yY2FIsrvhwicdNFvb+yn1Qe
fxGmquGQ13AtMlnOu8XX8ppF8EdQJ5e1kb63qVcc+OeVOrml6ryBnz64ovpj/Ncq
Oqgr9SqEUa0kq4TRltecjhaC+/wLnnSScCjqx5MHd4DzfS+5wLzBgtr0WuSfSg8C
7JwFEKdID8s4Kow/L697BUHGHkplhRPKjOBMj7QfkDHpAOmdgslq1pwaeQ7w67nC
o7I/5GxrinLlA/jEwD7nZbrzkyHC4vjMzE4g4nf5raofpFWRLLOrTlvMk+F1qGId
ze1XdU0tOoo6V4WH6RE7A7Kb3LPp4BdaNF1/STeoWh7QZZJU77PLm+yyLM3AZFvW
/HoNeOdX8FIWn/QzEcK+SUoECloO/OZf9nzpKor/PfDv4AK8WDNKtqCKjbo1s6zN
0k2rCI0uuD0JfmhU56APP608EUdsDJlb1ZhJLVXnI6xhd1AMvkDGSqDCPSNqtVmg
JnKwvAxrNqALX5RZu8KtvIL770VlOBGVOeioUzMlbcO7cZu/4n4eetpFbGABpwlX
lGDtEHwD2h0S1AmRB0GaY61pnOMHuttl28Cphv2tV9MPC9WCnHAiJykSlYUOCg+l
Amu/r0sjUk/HOvMuzcok2L4HAzongmTLHmRv8o5Nl07NEM0kQqo=
=NCwr
-----END PGP SIGNATURE-----

--7G+d9qaccbupwLTd--
