Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AED725A6B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240018AbjFGJaN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240080AbjFGJaE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:30:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786E6AA;
        Wed,  7 Jun 2023 02:30:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1334261549;
        Wed,  7 Jun 2023 09:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD7BC433EF;
        Wed,  7 Jun 2023 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686130202;
        bh=PMoboR6cDCTb92LA07ax+qaUKEEVVOPUJBaQR1KJASk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYZGC0loXe6yWW4O1NSXLWR2/fDG3GfhrFUjmF8a7bYRG7Hw93UuO/I4LVmgxPn7S
         feG+l4FI4fUPDlAtE9nooTzPqfN6DTXpW45mNO/2SKai8Wf5kl6YfltA8hhVFI+iiq
         y0EQLvlEdcivimYIYf1RmT+7CI2pFAZXbOgdIuUuWXQfwnDLq2immQ5DhBEmupjmk9
         N2WhrBAchLQcDG1tVYfXHHU8pRchnjL5tVA2uh5MK6+VpP5B1rq8N+LHbE4qbke5Jh
         8de1ZTf8F7TPQxkiOlLs7nq1fdRYHvagOyNDeA/WdZQZiT8neEovB5vw1kx64Le5vb
         PP3Sei5lwoY/g==
Date:   Wed, 7 Jun 2023 11:29:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Davis <afd@ti.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: davinci: Use struct name not type with
 devm_kzalloc()
Message-ID: <ZIBOF181se8lzU+8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Andrew Davis <afd@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230515175042.495377-1-afd@ti.com>
 <20230515175042.495377-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yHXXX5liZv5D9qih"
Content-Disposition: inline
In-Reply-To: <20230515175042.495377-2-afd@ti.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yHXXX5liZv5D9qih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 12:50:42PM -0500, Andrew Davis wrote:
> This reduces chance of error if the type of "dev" changes. While here
> remove extra error print out, this is not usually done for memory
> allocation failures.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Applied to for-next, thanks!


--yHXXX5liZv5D9qih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSAThIACgkQFA3kzBSg
Kbb0pg/8CRFjcIVwkXXd4Rgp/k/nu0sadutPB77XVcCJQ5sAPnwEExchc+R4lnnb
7HBZkNYXU/2Rc/IdoAjOBxeVQdLlf+PIayuESQXk9M7Ak2zZwXTyW+Pn2cwYcHB5
hb6bq+SPScmPHQCybcny6zeD4zZ6VLG5HDfSVOK4b2w6hbF/EKvbFWb50BS5ELhR
DJlNGKPOTptTqBIL9RMzQtZq6KGWCxaC+xlqYw2aFyGfRUBbUNAltylXKz/YiqIc
iek4nH9t8r02UdzvYBIOkj24AdFUgwQl/mp4++mYTwUXshXK5Cu2pKiJuI42YZuy
MWqo1atpCwIi3zMw4kk331uiDaiLr4lC5oC2UQ+Q4WX+GNkwloLWHNGYQVwZqsUe
h2Si9eO5Y+uyjfw7W5iHQyUstAAIUnJMmWuofIZKT1txlCZWNbYWxGGKMYERRfvt
cvRAZx3nNi7UnWNkWtQVsMDBijKJgxj4lefQRXzaleLOKWOv/w3HoJZekJNnPgLo
AqE4r1lE9pNpB1vVqyjV38JO5MulSDLqOsdDJedfp6BF32RLxjamwRi4750dVhuX
yNHgW8qXw88oTIX8nHFwgVnDOoCA4Gew24VBSJz1fmeJx7vInu0TlRRu80Hv3dUh
oQ8WTNP0f2+FBBjhM6V+gRGaGd0XodCNX2gPfd04pUTsrxNTrAM=
=0OOy
-----END PGP SIGNATURE-----

--yHXXX5liZv5D9qih--
