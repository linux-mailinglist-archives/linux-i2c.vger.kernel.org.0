Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29563212CB5
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 21:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgGBTBr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 15:01:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgGBTBr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jul 2020 15:01:47 -0400
Received: from localhost (p54b3347c.dip0.t-ipconnect.de [84.179.52.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E42B20702;
        Thu,  2 Jul 2020 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593716506;
        bh=7Ee6hw+CM1WcRUrZAjcq0KZxNpKTSLYZO/VPzD86Mrc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmCbTv5V06deyPAo7vAkWwog0g0XuMJFFVsLRMBFfkdZZKZwMjgLRobk02/1Dvqkj
         2+GO9M3YVjEcH+8H2jd7XMXHIrGEIUnHujAKW2/FK0ZCmFNNHDkt3BJALP8D70JCes
         xCpwaCTVtJzmJdg5JIO3QrP8P0xsGzU51VG+rM7g=
Date:   Thu, 2 Jul 2020 21:01:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Documentation (mm & i2c) questions (doubled words)
Message-ID: <20200702190143.GB1035@ninjato>
References: <187c35da-041e-dcf3-d14e-7046f57d0606@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <187c35da-041e-dcf3-d14e-7046f57d0606@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> in Documentation/i2c/upgrading-clients.rst:
> line 10-11:
>=20
>   This guide outlines how to alter existing Linux 2.6 client drivers from
>   the old to the new new binding methods.
>                  ^^^^^^^
>=20
> Is this like "really new" or newer than new?  or just a simple mistake?

It's a mistake. I assume you want to send the patch? Thanks for taking
care.


--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7+LxcACgkQFA3kzBSg
KbbcoxAAmlFLq1+qqKChWBc8DYrI+GQA9rLTQt4BYiwKnZsjBAs0uCjpmJJB7OlA
asj1n+XY02+vk5nORe8nfUNyFUVEOKHaJhqHLZhDTLwiFnOFonpBv6YqVeBpYHct
Nrr5DfJAhb1xxCFVvP4Wjq14KsJR9K6+F2CnYaUnWo1hCKNO5Tg2FFwgSrW6c0WD
m1cSLQ2NELQvRHVqaRBVE/MkhyPUCe+bavwZSQLFb8u9aqDcXz/7YDQTjCn0jk6g
KduSomUDZUObFvQrivVy8qZwOKhSBWBcAgnyNgTO3occdszusRqRt7HunQaP2Cjq
V8XZVNj2CHrurgctJHPXvV5RlrFqJwggdgfoBRBhMb6u6pNS4vGz8F+sr4dpcR78
bv+Ts16fXOYHMnKwv7uDJc9uxqMgwZqKX5KrvISLAt0U+qT2pXK1NGaai9Hr02H5
kceO27LrwKXE48SWgRBMAVCstqHFmIpQT1+T7J5sCVjzr7Fxf1qi3iVHa4GlXYd7
zYYOJENgrdKLj6VIodteSxqzIeGBaO8714xVdQJbDH7dj4X6VpdILYSfpN0QX/tu
lQsKbrTfOHtY+lzpAKd4Coq/iA0WxWnDmaOX0NCDdJOrPh5CDOyzQt0W6fZ1e7uD
dCTKrHksHkT3cUgLi+HrhmJeKUVGIZGCynO4cHVsK6kLpr5L8aA=
=bYoN
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
