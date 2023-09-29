Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1211D7B2D15
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 09:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbjI2Hdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 03:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjI2Hdw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 03:33:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0255C1A7;
        Fri, 29 Sep 2023 00:33:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4810AC433C8;
        Fri, 29 Sep 2023 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695972830;
        bh=g8FdDsQ1Zwr/ZjQDd8aYwCZmir6Os4Zbdr9LrVxV5eE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=le2Q3iNmRMuu2aDm/1gAb/Nkpjw+t2NGDgUoPMGdqB0TJGttAXFoEfwAnW0klPrEq
         JZq4Hyu8LmDTkOX4B0BRIYmVUAvnL1hVdgzQEKRjRUEGbqkB1A0vFIlAbN/l6sLRC0
         9E27r9drR8gvvqf6aT3lwP8KZeio0rmvnFO0F+zqjMYB364xECxc/6mxhRIWTrdJNj
         8PxUQ94htfAYs5PgSjTxHZ2FvSl3NNC+42Uvlp0ZoScSlplJdYa5mIpuxnmeMRtoY4
         8NQFPv2S3dXvLUJjfOeSoxSDDS3NjZJuDrw+fA1CLUtwQVkTBi2OtFkcVtWwQ+4LRC
         WQwAER+pJ851w==
Date:   Fri, 29 Sep 2023 09:33:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH v2 2/4] i2c: xgene-slimpro: Migrate to use generic PCC
 shmem related macros
Message-ID: <ZRZ92ybPW7ZDQzjK@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
References: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
 <20230927-pcc_defines-v2-2-0b8ffeaef2e5@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TVdwXygprCc3G6Ue"
Content-Disposition: inline
In-Reply-To: <20230927-pcc_defines-v2-2-0b8ffeaef2e5@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TVdwXygprCc3G6Ue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 05:26:11PM +0100, Sudeep Holla wrote:
> Use the newly defined common and generic PCC shared memory region
> related macros in this driver to replace the locally defined ones.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--TVdwXygprCc3G6Ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWfdsACgkQFA3kzBSg
KbZplQ/+PVjCOoJkwOjw4nUeBPAQv+KSkSaAkd4kTFssbOe4SIrdF7Gp4mT9Rb6Z
SH7kSKG+CtxL6kpFC0cPDTG7NzS1FFkOJCwCkEvPiF0LNBx0D3vqijVeFFk75ObG
cHpbwGjh5J8mOcQ1YMcjdImqMR4bdWC3PlT5eZI9WHbs5Y+/sjUtXFSjNggx7H2u
T9Rh/PdvJPph18Pv0KEahZ3e/VUh2piuRXlSEvuw+lPERWnm2U0as/BlGuZd6oDj
U0OrJABOM2UhJza2UCjHr0VZLO/rudjUJPrhaktyj6mKu6E0Nss1HKuql2j/ZGJZ
7U46GGsxoYIchI3vJ72Z1q1fhXwEKebe4izhvB9Ji3uaTPe6czS45UxJP3lX96lJ
SyYYJv3lV7EIYJFjUpFXXIzLQWwTRKBrkKux+dTzKZvQhzeq34QJZqlh8aeVapbC
KPeh87hs78mwyJas3mJdB6QwiVFu2Uaen05vIwlnJmdAnuJIDH5h7x1qyURybrpF
kkTX+IAa2Xx2+dCNQd7zkO1cDlmugjFK/VIgz6oyo+3ijLLIkOyn/kS4Aa5Q6UaB
ioaCqeHbKACyJ0ETNQRlybAQz1w1gBPatCMwmWCbX0YgbcCl8caHUphg9DJUCf2Z
U9AKXuW2EuDEIXRXsjpqRG93L+8bK4EE3P6o8EjvWegSe+CdH7A=
=z9Hg
-----END PGP SIGNATURE-----

--TVdwXygprCc3G6Ue--
