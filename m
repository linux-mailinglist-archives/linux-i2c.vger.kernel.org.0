Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB6C265443
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 23:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgIJVm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 17:42:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730825AbgIJMuj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 08:50:39 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD22320882;
        Thu, 10 Sep 2020 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599742207;
        bh=DqxNaNfAxBAFdZARRzshzmaGwx327r2VxbQbaMWY+Jc=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=pbXOrTd5KXxDPnmhFcVLnfFAZcllCFUP+VVM53WJsVW9sf1O7HXBU6EylvrYVEV5w
         vyXbueUqRW/dJjj7rgj/walpI+dkjHuIyj6qFIkRJ6DzzEBF54FubPkkrH5x1tyi6j
         m/Zukaa9CC2cg2EGmwdf0PNshU6qn4kRu1ofy4zo=
Date:   Thu, 10 Sep 2020 14:50:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Holger Assmann <h.assmann@pengutronix.de>
Subject: Re: [PATCH] i2c: stm32: do not display error when DMA is not
 requested
Message-ID: <20200910125004.GK1031@ninjato>
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
 <20200910100607.GJ1031@ninjato>
 <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline
In-Reply-To: <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Indeed, that's a good point. I'll rework it then, to avoid the dependency
> on dev_err_probe change. If that is ok, I propose to push a two patches serie
> with both this fix (updated) followed by a rebased version of the
> dev_err_probe patch from Krzysztof for dev_err_probe change.

Perfect!


--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9aIPgACgkQFA3kzBSg
KbYgHA//TZ1dChdYgru0+uAzrZfxdIpwWVnNaKn7ETaRe5xAJba24FzjiYdHUiTy
lI6TI4QbPc4Pc/YavOEmnuj6gRXsYSZE/ZKkLNdhESkNuGYcBfHwhWfXecs5J6RB
D55pc+nbkXwHZZZp/Ojo9e2/XW8m6I5BvophEKb3ORb54VENLekaF7YWBm0nzliy
yxQ6kwUQfJ9zQk9wr8QGRKy4XvRJp4VrOq8DfSdjnGev9rYIfsfDOn5RyHetUOqJ
D/wBck/RKqXYM+CXWijwe7qZLp3wHOGtgmv9KdBE4j/Jb4ZKk70K8xE8rRE9hUSS
7ZjoWIEfYbZs7pPvja2svuOy9cslLIjhOigaZn/hCVHQS5+uebRBUKUoyqZVUjcH
2JD7IdC6UtCqcv0D4HKMw6F01HQxx/YKUIs8Ik+ObRdeB3MKZNeGlM1HpRRDq52C
5G6wKWTlD+JQqRtrypvpYUNo151keAi5pKcPsKSPynglOc06Vadeagl1hwcP4tTD
dT4NjtsmAASoQcakM3QZ1TQ7pjnOwjj9C2QlN99+2/ysGKggMy/EimM4YNC8Ne9N
7FAtAFMS8awvHPjaHyXm77fcApgnMot6D6JpsINKEwRQ+T0ayVXRBVRSuU6/TCGK
995S7CtiEWnQgR9k0+HfuMHZCbRKT+/b6W//CMDaGzhnesfHJ54=
=9MtT
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
