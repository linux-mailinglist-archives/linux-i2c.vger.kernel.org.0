Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D5A30767F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 13:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhA1Mys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 07:54:48 -0500
Received: from www.zeus03.de ([194.117.254.33]:33210 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231827AbhA1Myd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 07:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=oRO8WDf/5KnXgWQXEksy1rdyBQlS
        PoX/B1tkUPaXezo=; b=36kAZjzCJ3A0h7EPAsHt0+R7/4W+QfBUjwBAmcfaP+91
        9oG3pGi3RaJ8lLto0GjT+nHBfgPA7iwQqfM0CaWz067qKZdj8KVnwAV5rTg1n2/0
        8WX5TbIrV1+UpdZX+i/nkxlHw3tCPeKi/4pG1NX23HfG7OsLfjhzwGf5Z814yB4=
Received: (qmail 240619 invoked from network); 28 Jan 2021 13:53:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2021 13:53:50 +0100
X-UD-Smtp-Session: l3s3148p1@FHQSYfW58pggAwDPXyX1AEdA8SGgn5QT
Date:   Thu, 28 Jan 2021 13:53:50 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Corey Minyard <cminyard@mvista.com>
Cc:     linux-i2c@vger.kernel.org, Asmaa Mnebhi <asmaa@nvidia.com>,
        Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ipmi: remove open coded version of SMBus block
 write
Message-ID: <20210128125350.GP963@ninjato>
References: <20210128085544.7609-1-wsa+renesas@sang-engineering.com>
 <20210128123757.GW21462@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R3SAtXwgGp429mN7"
Content-Disposition: inline
In-Reply-To: <20210128123757.GW21462@minyard.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--R3SAtXwgGp429mN7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2021 at 06:37:57AM -0600, Corey Minyard wrote:
> Looks good, do you want this in the IPMI tree or are you handling this
> another way?

I can take it but would prefer the IPMI tree.

Thanks!


--R3SAtXwgGp429mN7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASs9oACgkQFA3kzBSg
KbbxVxAAsnkVAMU3qhmK/nVCKJwyEIime7+1Z71ZVZUxscez4zCtHGvhzLOleaxh
GLz8+0qsB6GBZGO6xZkHEdSbuP7dhwCBIqWG398Plu/wL8NKF/TzMI67KR0iDZCV
BS8zHaB+WMB1KwpUAYEsn2abtD0wJTrgeMRET/JXDRp3jcmsPCVExafSQ9TS+cXK
pTpaiZ06SzMArMxd+t30RD60qQPdLCOkHc1v+vYeAv7nElfhF/ndhL+k95Axzbf5
X8VsNmSM8dk8MWWAuCNjVZnS2sfzA/9G+i2xgESs8UCNfDNcKAxPiNnDa4G7AGRN
qidR7iRGlTL21rctXcpbRqylKi9X/Zo7Ql8LrOPRuFlb64ptMApVglYjvqCYsB4+
qkWZZDdL372mD9Osf6pUS+BajbBFreo9gvUtKHY5iWj6zPkSjgkVgxfPKlhPxrhc
xRYUNEf+rGS6sbZeV9yQFG9w1Vt08Z2Pa8TVd9T0s8dEBiwfXLxURuY5DWRmV3dt
17xoAkek+GHr9xEEDjskAXbnncb4W0m3+60vmWthpTRKZH9p0UglzzYzmHseTby9
17xN3I4OORhaAk49O63Jlz4dd5Mf0FgQQFi+a8fbeYiIX+2fM8JY5U0nYzRRYc+y
iuSR7rs3udXJi22hQbDyk14GlwF0dNpyEhGFM0WZV7lqj3hcGZI=
=uUBv
-----END PGP SIGNATURE-----

--R3SAtXwgGp429mN7--
