Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D42F39C05F
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 21:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFDTXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 15:23:07 -0400
Received: from www.zeus03.de ([194.117.254.33]:37360 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229810AbhFDTXG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 15:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UIcpbPfwoP5mNySIfoZrqu8LeRve
        9Bkq/PE7sZLTal4=; b=B/iP2JeE8FWIdYq6AX//cjvgGT8tXrWjtFAm27L/LQs8
        bAOJgzemh+OFnJWwJvH6ckrs+3t/sR7YLI7BlnI5yZ8gZasanimx/OASS3y+O11Y
        w+BWTTGJtNXwOwJPk8VP+e2rMRLofpRITkkjb42YQ7Y0lLmGOksCpjY12y+25tA=
Received: (qmail 1467812 invoked from network); 4 Jun 2021 21:21:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2021 21:21:18 +0200
X-UD-Smtp-Session: l3s3148p1@byiYmPXDZKtUhs97
Date:   Fri, 4 Jun 2021 21:21:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <YLp9Lc5Ondu3Gicg@kunai>
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
 <YK1fwC4aR5RKTPcB@kunai>
 <20210602110332.73f9cbc1@endymion>
 <YLew8cFWTRQKrBuk@kunai>
 <20210604155708.14159db0@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NpjlibQHeb7b2BBQ"
Content-Disposition: inline
In-Reply-To: <20210604155708.14159db0@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NpjlibQHeb7b2BBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes I do care. Apparently I wasn't Cc'd on that thread so I wasn't even
> aware that patch existed. It would be very nice if you could bump the
> thread to me (unless there's a way to retrieve it from patchwork that I
> didn't find?)

Sadly, I can't send the whole thread. I thought a had a local archive
collected via gmane, but it seems this is not as complete as I hoped for
:( You can download the patch itself as mbox, however. Check the upper
right corner of the patchwork page. Or search for "mbox".

> If we only want *one* I2C block read at a specified offset then i2cget
> seems more appropriate indeed.

I don't have a clear opinion here. On the one hand, if we want just one
block read, this is more a "get" than a "dump". On the other hand,
i2cdump already has a range-parameter. So, from a user perspective,
keeping i2cget to single values and update the range parameter in
i2cdump might be least confusing?


--NpjlibQHeb7b2BBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6fSkACgkQFA3kzBSg
KbaR/A/+JumQj2zHEeDfbo3gDSY2T5kM9+Lr2XooLOazNY5HkojNZuyyHYJhGH/f
ajwE76IOvrgCFlCOQwMj859PkitEu6XeR/Xevf1euGEKtWuYp3BRgPJBtMdoPGLe
mRUvXuGOSDHFBJhdTv8bdCJEEkvvlC+v3ERbl7zq8y6ubU7RURV5F6Sva/qm//Zj
e+N7SWOYlC21MiyBC+nVpQ4SDMGd02k/QIQ1svzt3NEqOTCywG4LCYnLdsNaAvD1
aWYiNk4O8A2v3uvz1jfCcwWkIk5Gg33J/tVn6qmNlJGO5pu/ldPHCUbapm64GjRY
CmXNu2vI3VADvCBA1qm4W1B26TSI/SHhfje+QzFsF3ict7XYoOe4wEo5LRVKh8FD
GHQNetE+9xZHhx9fBrSWJkCQ4ZWQWpxh+rqz5qiP98ELINKeyvpdP5Mhel3bmFi7
PQSRTtDBtLpKbf11AMtVY41LeYp3lkK44bNOGo+IWQiAj8kMspspUBtQASNkh4Uv
eiK/BGmXvI35BlweJuj4ot1IePfGO3ek3m00mxgzOu0SerI/Pka/Vf4zaLcM9keE
wIGMCFz6A3zIy9lVZCPQ1PY5BHhFkHYCUB4kGbhW+vNwnDNYRAI2aA9rTBdebc58
D06uQWzLqQnXs3bFfVxdk89ciZiJq1NKljHT4CX/zrj1PT7QCQA=
=l8cP
-----END PGP SIGNATURE-----

--NpjlibQHeb7b2BBQ--
