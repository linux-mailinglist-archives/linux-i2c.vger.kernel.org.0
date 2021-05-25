Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE4D390A97
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 22:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhEYUht (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 16:37:49 -0400
Received: from www.zeus03.de ([194.117.254.33]:36720 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233263AbhEYUht (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 16:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=4Siig0ZdmDeZkvLkh70DL0A+cdl0
        oIQXSWBY2PK2Pv4=; b=dPcvhB/OvzgWgKr5Xog6iWFhG9CgtN8LJXCMN7XUTIAp
        apAjDgE8V9en5WiUK3vIYx8oZkl+EDHNz8QVCh7cLqeOtFPK1ychi0RxX3II2Ys+
        nDihUoTH3u9l4cmfiJ+xPhpLc0NkSkn1wYdUJZzuo5VX+DuEf+AjIjm7pg18cCo=
Received: (qmail 1380845 invoked from network); 25 May 2021 22:36:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2021 22:36:16 +0200
X-UD-Smtp-Session: l3s3148p1@bfZLei3DMt0gAwDPXxHuAKg5HweM3jRU
Date:   Tue, 25 May 2021 22:36:16 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <YK1fwC4aR5RKTPcB@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
 <20210226174337.63a9c2a6@endymion>
 <20210310204648.GA332643@ninjato>
 <87tuoe5zfc.fsf@dell.be.48ers.dk>
 <20210413125433.GA9879@kunai>
 <20210521132158.6e0689c0@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cZLVD47e/zI65E/b"
Content-Disposition: inline
In-Reply-To: <20210521132158.6e0689c0@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cZLVD47e/zI65E/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> release, OTOH we have a regression in one of the tools, which is
> something rare (thankfully) and problematic enough to justify a rush of
> schedule.

Yeah. Sorry about the regression!

> I'll take care of that ASAP if that's OK with you. If you have any
> other change that should make it into 4.3, now is the time to commit it.

Thank you. I don't have any patches left but I will review the ones
waiting in patchwork right now.


--cZLVD47e/zI65E/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtX8AACgkQFA3kzBSg
KbbS2A/+KFVjU09Qwp7IkZR747xGagVLJIHWLDEsD/xbZXg5mJOGZvqO5twyeTxZ
nldkGDYBfgGkBNNzeXW/vvqV5ZbkCjs4g4bf9Hgmw5j5bG0fa7AEE/kOHJJa3Q4T
mDlta2V41YHBgtwARkIHXfzEG3FZz3TWYsfNc1QIoz+J8se7tru2ugj6L8LbByfn
+NjN/IenvYYx17JbL1g9pcXEA0HhoSVl1tPkG69nNXNts0Z4gmjfPfsZGKl+Jbgh
JZdgBYaoib1asToYIxz/37VBxd1VwBbgcdlQn0YKk/BNjYjv8QzSE40IzFDOCOWb
uH3ymXh4T+7oj+NifvQFmic3semo5DrYQQVgkKUTBAjeW7HBWSPgQNmYcR6Pzdgg
GsmW8nxF10qO0tRWrOnabwSZOUhoOmc3Y4CO4l1nd+rWtUuZgW2A/G3Fg0IDK3LK
z2e6h9FGvBThb4RJq3inHCE+BNykc4LXfg0S987cW+7E6lLLz6vNa48mxRwSXPFT
/Gc3Vgk6OeDXK1cLhPx1RZ8J9XiIlEHGBJknfrETr7i+AnNVLn7cdPlXWwSV437K
hh0EsIMi0U5IABRQRsWTY/bp1JRUL90O+Dc615+bG7f6zyFodENBU3L1oWKJDVzG
PmunQ/1WdVfbbVvGo59bVDsdmmrwhzVBYwFjaC3iM/w7LEP7ha0=
=qzqe
-----END PGP SIGNATURE-----

--cZLVD47e/zI65E/b--
