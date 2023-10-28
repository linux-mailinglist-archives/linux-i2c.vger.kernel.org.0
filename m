Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41227DA740
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 15:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjJ1NbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 09:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJ1NbK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 09:31:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBB7E5
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 06:31:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5E0C433C7;
        Sat, 28 Oct 2023 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698499867;
        bh=gBP3glv6afepKnA9zNUdSdOeKTh6qfPeOCMMmWtBx4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b0ulZcONzlSEoifyGuvkRsVAv8rLqkTCfQx6MiO31JSaQAHf9UdLfJ1EvfT7yxhx7
         Ogpm8Q7mK2kaPa0WrGUBKPZm52+0/zWA2vCUQQXX51UNCRsSVP40zQ/iLHtbiEIfAS
         VrjGmiWamBc+6TfE4je5gqsQ6Q8+03bowKUP9iiFbWNZdoi0DK4Dal/WWKFc0cQu+U
         KhcIffIzhxeFmvXNbj1X9K0qmBT6+TtDznARqo8PILll7kqkgfeOw5H25wrI8cZBaj
         Bm6uwnsTlXyPRD2lB9bmbhEEeWc/s4pShnpr7ILFFCXbqq26nk61zmQXsTmgqORs+v
         8+Aoh3x8ybw9Q==
Date:   Sat, 28 Oct 2023 15:31:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Use new helper acpi_use_parent_companion
Message-ID: <ZT0NFgr7t+BbrlCn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VDhSQjZ5Lig59x0D"
Content-Disposition: inline
In-Reply-To: <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VDhSQjZ5Lig59x0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2023 at 11:36:17PM +0200, Heiner Kallweit wrote:
> Use new helper acpi_use_parent_companion to simplify the code.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--VDhSQjZ5Lig59x0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU9DRYACgkQFA3kzBSg
KbZtHw//a+IW1Jk1egi/2k9E2jk9Y641xuC31yG3m+7nMwRlVTLmxKKqKNK62r9e
Eu10a9jQ2HAqfskXBvs7/XVBdZL1Ry4BNZH6OXFV0qjrN8yPHr5J2qA3DECfAWST
u1H1mEsjKwIQEmSeUYmbxmmyAkkIC3ZANfzrz2jpmnPnfCK0rmLRXhMRXK+LN9Im
JdXAuaApxEWSDjw1vY7Q8rmUhSjyFvFGcvIQWraxjCQ/sw+gpadeKgo53tpeeYUv
py7hUnD5ascPpm3YY26Kuo3/ii/kRBxSNvM4q7hdLyWD5vrtY7CsevtyYAx5D6jI
XnH49UF65DEq82yIo9W8LzcytoKi1ZX+yPPhpNY5otV1biT+uZjex2l2PybKdJFC
4PI3RqZtZ4jvpX7Pa9Qda5P/sitQPZLDJB4HWzOjkGA51ZlKHrH+e0GTlpoy8Y3/
rA1jUbjxtG6w+WthSke2YwWs4FXoGefBlafQ6FYQ5ppmWdyvk+7RRKsH08RR5ZN6
J58PwGfozPBDgrhVCu77DS0ObEn26qT+nA2XMAAFbEU7lUq6sRucM71fJWKkiY6p
DN9XN1m7EMZYqInXW0diCTtJsq7H3HlfhONDCBhMjEuyiUTd8B3txLtIxhDuDA57
bWYoR6sUdVezypO+4ZGFrKMw83acALM0ouyFQowTawU//FfrItg=
=tqrD
-----END PGP SIGNATURE-----

--VDhSQjZ5Lig59x0D--
