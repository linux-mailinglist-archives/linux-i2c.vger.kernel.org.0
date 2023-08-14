Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C920477BA40
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjHNNia (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjHNNiE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:38:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D81106;
        Mon, 14 Aug 2023 06:38:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16F786528D;
        Mon, 14 Aug 2023 13:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85A0C433C7;
        Mon, 14 Aug 2023 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692020282;
        bh=/rN+29f7GzRjIFzPcRNPEZydBgi2IxEMnetmSFZkngY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jFnXChebZxcG28nCRAiB6WMaflPcYRKKB02m+Ay4zKeOVFMD2JUhqZ2/S7F6+05Mb
         /pc1azPmnfqmVFhEIRBdfq7Ug/C8WpiOZJ7Rj2bFk9T1jZIbg9GJqHBF/rCkA3mk8x
         H3SgdWFKx/aVnznuiBZx8JJuNOzl6XGYUF/VjbkXQ6rlv6YoAHGKtY2rjefgsviOVK
         td7eRsviSSnb8peaXbNq8g0/rf8fhfnT63eCGgNFFlXZSs+eL6E6REhGkTRnanpX4n
         QeZTnxw89tIs7WqQaoLYqETnexyKFNbcsv4pW/I/Fbn+vlnrMvMyL0GYZK3vz0TtnU
         5ti+RDIHWpcaQ==
Date:   Mon, 14 Aug 2023 15:37:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Parker Newman <pnewman@connecttech.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Message-ID: <ZNouN8t59ldse1ih@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Parker Newman <pnewman@connecttech.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804215631.wc22pkyetsyyt5ye@intel.intel>
 <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xkemeX0RXH709VdJ"
Content-Disposition: inline
In-Reply-To: <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xkemeX0RXH709VdJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Cc'eing Akhil as well for his opinion on this.
> The fix looks valid to me. Must have been a typo there.

I'll count this as an ack. Thanks!


--xkemeX0RXH709VdJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaLjYACgkQFA3kzBSg
KbadXA/+OEttBQJ8lsG3CCUQ4cPF/s2BmAPBHXGLvSqZBsfQB7s8bv6ZAemLkGgv
agTSJ/rffh8dPrS2XdL4sZq5Pn+NMPa8X+XalSkcxzc4vn1GBE/VjKCz+JapX+xI
ZOfu7yXxynkHn7eg2hFhZng6b1ID+HePPbIKErbGpZi3zHkeNVV5Vkiw5QBUAxwS
BO5xlNSQ4GEJpDgE5ia9toGvIBdVtigJclDQ4Wwzac/kkhja5fomnk4ZXDozeeQs
h0CXcJ9dCzDuIm4qMO+H15siEs606Hhe9chF216JNpm9MxnDUbJG6vLif6mQQqkq
rEeSlBGOb91CzYYzGDq4nVWqWBvYMuz5tBGnJ83G5/DlGBvOahTaxRaBzbIM+uTM
0oHQnN1akhg6Q/seg4vEfTvpTBqGSOi5irUGg3+qWusELB5lS2gd47Z5ItpO+Xda
nFwtR/Hba6Ct3Jf/UxgI+Yq5JSug6wt+T0/aH+zw3Hd8NwIqAX9bpQ1cPQ22zpKj
NJ9uCUKquTkwOymydtUkHfy12CssFSYgNPBJwWjbYk4xe1ZAaaoyUAvAEl/nf9nu
YjbrilmAL78p9AD7IkX00ajvAMlYuLSg0rUSGkFz8P7viSoF8AUEIll38IAcd8uU
9IHCnBVgHTBPz4cCbvy+hKR1uXkyqliD4yviFPp89CwIS7beNZ8=
=SRVI
-----END PGP SIGNATURE-----

--xkemeX0RXH709VdJ--
