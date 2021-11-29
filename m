Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF706462225
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhK2U31 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234540AbhK2UZq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:25:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F488C025542;
        Mon, 29 Nov 2021 09:00:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0B11615BF;
        Mon, 29 Nov 2021 17:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632D0C53FC7;
        Mon, 29 Nov 2021 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638205207;
        bh=zp3v0tEjkVXyMXsgHVlwxFZPWYI5F7lWo5ERzAP4pv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M/rJdA5ldDAhTzPUsqVIJLJfyJxzsDObnp0IfBWxjotm4mcnu/EY3bvTLtUULKbA/
         s7QTs6doatOqN9SZusgexDLtOckbIxW12aIm3g+yA5D0g5zOdM3YHrsgeuJak0S89U
         9HVWzT/i6HxtxUSC/HZDHxCTFoEeg9ivBIBr4rlYoYBJdfbEh9Wugk+jq23FVwt+7v
         IEDKhCQwdqWSonKvP1Qr3IK7oG0fl+Wa85ODDOBd+xBwlUeeFi30hanLdU9e3GtrFb
         YGAdx8pf6RPsELcACt0qmWpXrmxdCR/s3a99d1vJR0o/+HEnXf91mMW2CWJmVkOYfd
         Ga+PxzDc3iPRA==
Date:   Mon, 29 Nov 2021 18:00:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, bala.senthil@intel.com,
        pandith.n@intel.com
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters
 for Elkhart Lake PSE
Message-ID: <YaUHFM2xyLQiXFMt@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, bala.senthil@intel.com,
        pandith.n@intel.com
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
 <44b0646b-165a-065e-1029-026ef1b6cc27@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/SwrNiUKbKjtHACx"
Content-Disposition: inline
In-Reply-To: <44b0646b-165a-065e-1029-026ef1b6cc27@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/SwrNiUKbKjtHACx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jarkko,

> To both:

If it is not causing too much trouble for you, I'd appreciate if you
could ack patches separately. This gives me a better overview in
patchwork which series are completely checked.

Thanks and happy hacking,

   Wolfram


--/SwrNiUKbKjtHACx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBxMACgkQFA3kzBSg
KbZluA/8CDJ73gKGvbrKGQwwnIZh21vnMhozZyRI4Bovh8aN95i0W3u9zZgc1K/e
gMLqTH8498jZ4Wkw3nIks899PTLCUc1oEhnHMdtdqy4D5tGoJdIsZCwKVvefqfzR
RBQka5QeilBVsers35VWHR49+l9Qh6bGdxYVy3LanhQ5e3zMDjYatwWX2OwcKqSb
H5Eakq+Syuwbdo65ZrsnBQ5BDL7EO1+enrvbkwGy/sVxnc4e9GG36wACcNitC9r8
I2D+BzlpxNlsqzIimY+ct+ZW1ahk6Nbi7cejrnMEwop/nlDBPGO7wCso6hXSqlWR
UWbX4peA/INBeH6pFo6ZzYCc4mVVGGysJBPrezsGhBG/zSP2o2pIZ6doryx02vdi
IY4Wk+0/ednZYvzrUvt2Nq0YHuadeR7weCG9zbN7/U8QgDxJV6DuU+GM/5ONRNMd
jZCfsBNDI6UmXzAnpwsYzdij6q3BS+VTjnNAeR+Ylq84LdC0CjpFH5ZaYpG4F8dh
awV6KtK4d4+Sr6SIaBWpjlf9arW4bEqm+0DQUtP+za3HDrA0ImFP6Rca7hZLHVkw
vZUpRjXqF43ctsCHTNTFJGo+jgEPgEi8Z13UQYobz7tx/CX89w9JwKly7QtBjo76
S5j05AFoEEK0TbolasVzkAq9Qa1t8et5/MVVWuIW/e4ceuQu5C4=
=lDLI
-----END PGP SIGNATURE-----

--/SwrNiUKbKjtHACx--
