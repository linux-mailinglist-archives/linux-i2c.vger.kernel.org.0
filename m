Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEAEB7A676E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 16:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbjISO6k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 10:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbjISO6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 10:58:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A8192;
        Tue, 19 Sep 2023 07:58:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54F5C433C7;
        Tue, 19 Sep 2023 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695135514;
        bh=iGa9mOvxXrr916ZLBDwrxfoGhDEaWcNjxHwM+NjsHok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TQTE17aEj0vvKuho86KYfIFl0ILTGLi4u9jdY0svVQd20e5Crn53DxoJVp+8frWLw
         aIIUaHUu30ruCIsjyyyd/z98bMHBu/NqU2NnqnZzTEViIGYTrFK1XVC0OyeDdjLC2Q
         3701nf8nUiS13I2oDgS8cI7rDyHHAlbQuGQLZxK2Mh7wj8sGuY5MQhZrw4/MB7N0Lo
         JdFNt3betV9cBJmZWEw+ym63hiZsjbvNBRDJm+Hw3iQeUt6G0ZhXpR+w++m1BYhsPC
         oK2a0UOMcGuISe6XloughLjbyCZvNNZ5tedJPaiC+R+cnsUnBMCXdT39cSKSgzZn21
         FtMCus3hbZe/A==
Date:   Tue, 19 Sep 2023 16:58:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Benjamin Bara <bbara93@gmail.com>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [GIT PULL] Immutable branch between MFD, I2C and Reboot due for
 the v6.7 merge window
Message-ID: <ZQm3FgIH+bQb8emb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        Benjamin Bara <bbara93@gmail.com>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>, stable@vger.kernel.org,
        Nishanth Menon <nm@ti.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
 <20230919144644.GX13143@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K5ChaIBwZ+fsUzNw"
Content-Disposition: inline
In-Reply-To: <20230919144644.GX13143@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K5ChaIBwZ+fsUzNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 03:46:44PM +0100, Lee Jones wrote:
> Enjoy!
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-i2c-re=
boot-v6.7
>=20
> for you to fetch changes up to 510f276df2b91efd73f6c53be62b7e692ff533c1:
>=20
>   mfd: tps6586x: Register restart handler (2023-07-28 11:33:20 +0100)

Pulled, thanks!


--K5ChaIBwZ+fsUzNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJtxYACgkQFA3kzBSg
KbYomQ/+I1i6wa9VyhVNrsIjBWBmYsLnZcvqk0cK2TwYmYoQnnvjPOyuoYKDRVZR
TBYgPogyQFyqNG5hxmqt3J5QunnaxrcdY2zWyG+kOb9m4T/bISfImOyWpDVoFP+z
E09z6ny5WQGsCSn/FSsRrKxQm/g40Jr9kUiWsd/mrHBOP3TP2mDQBpkhX3OPdW+d
Dm0FzWbUY3CJtvYtVS7EWGYUthitZh8cyp7TUTgd/k50H/9nyhrEf0xn95FyoNQL
BN3nJeuJ+sR3YNxknJAYuI3nEmjTt17rgIGSR0q0Y83C85NDBf3WCD1IbvJjXz3c
UVrYL4R6jFPZ4Gfc2wLCyk4ZTNGNU+p/o5chiLfOL60skBigeLxOyduN1dVea1rB
OcHbCu2T5d7LCgjcUBVUwJg3A/HZKKOz3q9/e3q4W1altwpgKcJ3D9XNxf8GWGgq
ic/9iPcs4CujyfsSnIMt2BH1+wACqc/tPr7jyRq7Sy6nIJkOnafh/pnivM6oGNNl
BLQCgBbkXAefXQwAD0b7PH/IBIO3WuIsaPmAzLq8oUFixPzp4RaFSNARLYAOwlVY
BxdfQwa8LEXYVq63zFkZ7TbG7BdRtXc9agOXLNHYH2wtMPNsfc9pEqS8d8BVDszD
2O/US/Y1kMAVly5hJzW1EXrlnleK79Wna9mDa4F4flyzVEit4rM=
=db+7
-----END PGP SIGNATURE-----

--K5ChaIBwZ+fsUzNw--
