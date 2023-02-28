Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89146A575D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 12:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjB1LAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 06:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjB1LAn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 06:00:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7030310A8C;
        Tue, 28 Feb 2023 03:00:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2DF2FB80D3B;
        Tue, 28 Feb 2023 11:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9312CC433D2;
        Tue, 28 Feb 2023 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677582035;
        bh=rEAtiDSRCtKX9bKqB93LYzcQBdQZdJEx+f5yqqdCG6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ELUk+FAlpQlzUn2NKo8cS1Rd6QZ6HqsqgYwVMvMMLXsnxIv+VKMm0lS5r5tsFaQym
         T3iiy8k4a88ZScWm8aF5h4D0plZAERsZnsz0POjhscdk+8fcla6+G7Cwo/2vEiKiiL
         T+9kThK0Zc/si6evVbsj+/WlS8gf57lpe7QYwt3+weR62nJgVL2diUFeMQjorY1DeC
         LJk+jaYXSTHZaqxwGZQc2xtWrfXFf5buYHIyEavgnJRI9Nb8/u20RllnX8ltOhzYMV
         ne2ou/4jvUteW4oK9iNpg/LYubTLm3ZQ972CGItpry8I19XQd5IBp/3t+ofI+OuLyu
         lhWyeMIovVmwA==
Date:   Tue, 28 Feb 2023 12:00:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Message-ID: <Y/3e0JsMmX6hlNHI@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
References: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
 <Y/0EIRsycj8EWjrz@ninjato>
 <47ed190e-ebae-fdc6-f46a-f42a36fb6f26@molgen.mpg.de>
 <Y/3cYL0s1Ul9fgR+@ninjato>
 <1669a3d8-1d19-e91b-8f6e-36f5037fff47@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ELwBC1d5Q9ON43ep"
Content-Disposition: inline
In-Reply-To: <1669a3d8-1d19-e91b-8f6e-36f5037fff47@molgen.mpg.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ELwBC1d5Q9ON43ep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,


> It does. After your command, Linux logs:

Cool!

> I can cook up a patch, if you want.

Yes, please.

Happy hacking,

   Wolfram


--ELwBC1d5Q9ON43ep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmP93s8ACgkQFA3kzBSg
KbZe8BAAn17IxDc57DWELBUGUE/uK/f2CfM6478p0bBXhzrg0kU3KGP/MpYCGfaY
OxFi+skC2qjJgepjAZzyZya7ZV7SKS7Z2lSUfa8rup6F3WXgA//yC7Jobl3TM1iD
zb3Sd9EnB4fWqTfyDyqmgwiJFWwd0N6CXuPCFNBfh/bwBZeBidr5OcbPNYo89rQ1
qYL8LxTNahYhAvXrgvCg+N3FmvUaopc2sZWsa8gjml4sI23LVaHyvsmA+W9UEZb2
hi84c26F787zVB78yRdV8+ko+Y3Rw4+iTZAZSxyuT9FE70cpZwu5Caux//yXuKKF
KIj/cyyF58+aiJe1A9Kze1XzrvW3A88CPjwoF0PZOiFjRNgeXenTaQfKL1NPMlbF
q5rLBxUE648xoMBVi4/KG/CYnTzlGOrb0z5OmXTej+wD6SvilP5gC8t/xg20Xsoz
QKHcgUDhPLoagDnc6P8uCjUtiGnvvRfBFpp9KnPPNn1vCRr2R/grV2eF8IZEerWq
ydFI4P79I3V9H7JfkNwOxfDW4UEPuOvGdTsT3UyQrpBwvJs8zO5YZXY1OuPH50zF
Vc0u81zvZ/BNQ3CZXqBggdLInoxffQ77GBPAFHpBZwV3TQu746lfA9i1oxPwhl1b
I92Ljjorey0KQsG0tj0MdtKjd/Pz9gKRkUDtkeEU9oKZz232VLI=
=u5lo
-----END PGP SIGNATURE-----

--ELwBC1d5Q9ON43ep--
