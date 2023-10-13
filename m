Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22EA17C7E66
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 09:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjJMHLm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 03:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJMHLl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 03:11:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC7AB7;
        Fri, 13 Oct 2023 00:11:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F918C433C8;
        Fri, 13 Oct 2023 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697181099;
        bh=MwaYf7/fVl29eeEa1PR2hVMy/u8Gb+fyB79xZCGocz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RfYM7HrzJUY5Keay15CPDjBgu3kJqSs4/uctlZq02hUWkzSFnBUwa7Majwvh6VX2p
         0ZBL0bktqn5BBgFIl7ftJX3PG1DEkjPYrfp6a6HumjgQsAG+G7IAWlCH+iKifcBb+0
         kChUKP6avE+fRfeXCm+klY//emkEkQJsdidHVzDIbNyfvEh+Rsl0vtDv5JtZb6QGx2
         Z182q/w8OSKAec67XDmfG79oWqxLb4SXeEyG0HOWxYcf4ch5gJ2tHE68G6UJ95tDS1
         LuW3P/uWPKhDVgwV46vuLv55AHM8kF7LXOvuS3+jafcmIg4XeEJenh3HqwXW3Gskfh
         8lR4tEGPPRK6g==
Date:   Fri, 13 Oct 2023 09:11:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        pierre.gondois@arm.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: mv64xxx: add support for FSM based recovery
Message-ID: <ZSjtpWukWHeZp///@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        pierre.gondois@arm.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231006003321.2100016-1-chris.packham@alliedtelesis.co.nz>
 <20231006003321.2100016-4-chris.packham@alliedtelesis.co.nz>
 <20231012201541.nzlxyjngm3d5asir@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yUuHd2/0fA2YiRP9"
Content-Disposition: inline
In-Reply-To: <20231012201541.nzlxyjngm3d5asir@zenone.zhora.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yUuHd2/0fA2YiRP9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> mmmhhh... still a bit skeptical about waiting 100 times 10us in
> atomic.

Has it been discussed already why the non-atomic version of
read_poll_timeout is not enough?


--yUuHd2/0fA2YiRP9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUo7aIACgkQFA3kzBSg
Kbal9A//YfTs2FwExG43E0KNO0IIjqQIEObxAQBXKGd7PJyY7JKWbqrlYbskfRS8
7U6e9oMkpWvT91CgcgOwgF30VqDe59rdo/amSGdBmeopShnHZdc63sVEkTTFkAeI
l76gwWGx6oip5WZvVFMp67GC/Fd0CZILgh1JURVL0Ijoyd7XdLo8NCZRNBBoA0SV
HGhfZW4xmLHT02stokWcfUrmWDbYj5WvG7HbgwgPaFVK67ny4vfR1cbZJMXBG5LQ
Lj80y6mHVCRJUacAoL78GK9yK+JrRZQ5dgaETCoYzDL/FXvGlUsPw6HQmh67pMTX
JnVo1jhVqrkn/SIhXDfubk3zphgOFMEsr3ketN7OGDDTl/huux3ySu3R4wM9KQBL
3lFQrMXrsEbLMMd34z84ZRzeYn/KXk7AJp6gc2yPfHYaNN23KV6WCyKDtJfMA90S
EONP5VmsvS39VxkAJUXWIVBiL9zV1EAo3rYLIXe8AE5T66lC+ioVacM+/VoUi8ba
K8WwlM2uElr/TNI8sPyGyCNb+DK6/dRXVV0szakGB+D31+a+z3fMLI5dqoU4C+Dp
HpI18NOzvVVVTY7Jdb8ZKDKQS0BU/XNe8Ld7IFRjOuliwHq5k//qccEF6yQbs01M
cLTIGfrFIc9wNvqn3I9Dijea1VEAxbjiDKpa1QVbEq98mqGL/2Y=
=QbRi
-----END PGP SIGNATURE-----

--yUuHd2/0fA2YiRP9--
