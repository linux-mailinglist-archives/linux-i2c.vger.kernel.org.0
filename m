Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D058C614AA9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiKAM3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiKAM3d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:29:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FB22DE1;
        Tue,  1 Nov 2022 05:29:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5C303B81C89;
        Tue,  1 Nov 2022 12:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F73DC433C1;
        Tue,  1 Nov 2022 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667305769;
        bh=fE/QK2tz0bp4uZzAiCUSbLtHhUCqal1+EorRLas3dn0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Og93aCaKP6Y3Sw1w3Y47CNFasLfm8mO5lerezUgYEZ4QFG1HzEa8bJcMLlV07A3mc
         rP1PnA5Gh17L+ILoGMk/azbm8TsT28ztYa+dneSVHjJGvMhSjYx9pFIuMUzsbgYML8
         uW1J63ev4WfMFkY4Ygxt0gopO0RV80cMDL9cK9lxtoCzUGcWXvPxKcsg/kkzj1eZ7t
         wG/DmMJmVjuxnsr5waFeQb/PgQFyTOyIZYyw3wRh2/ctk0Q9WKYlFYemCziubUR/zh
         BBMk24nHh6++CsRKO69pMhihvGCav5Eu+5lpx4SpoX1m6BoA1qS8LicRiY7QLlb5Dh
         OQ4Ds+clrvCmQ==
Date:   Tue, 1 Nov 2022 13:29:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Chen Zhongjin <chenzhongjin@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jdelvare@suse.com
Subject: Re: [PATCH v2] i2c: piix4: Fix adapter not be removed in
 piix4_remove()
Message-ID: <Y2ERIsY9/IKLuXoG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chen Zhongjin <chenzhongjin@huawei.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jdelvare@suse.com
References: <20221027121353.181695-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="otMN8fDUrbC6X6ca"
Content-Disposition: inline
In-Reply-To: <20221027121353.181695-1-chenzhongjin@huawei.com>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--otMN8fDUrbC6X6ca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 08:13:53PM +0800, Chen Zhongjin wrote:
> In piix4_probe(), the piix4 adapter will be registered in:
>=20
>    piix4_probe()
>      piix4_add_adapters_sb800() / piix4_add_adapter()
>        i2c_add_adapter()
>=20
> Based on the probed device type, piix4_add_adapters_sb800() or single
> piix4_add_adapter() will be called.
> For the former case, piix4_adapter_count is set as the number of adapters,
> while for antoher case it is not set and kept default *zero*.
>=20
> When piix4 is removed, piix4_remove() removes the adapters added in
> piix4_probe(), basing on the piix4_adapter_count value.
> Because the count is zero for the single adapter case, the adapter won't
> be removed and makes the sources allocated for adapter leaked, such as
> the i2c client and device.
>=20
> These sources can still be accessed by i2c or bus and cause problems.
> An easily reproduced case is that if a new adapter is registered, i2c
> will get the leaked adapter and try to call smbus_algorithm, which was
> already freed:
>=20
> Triggered by: rmmod i2c_piix4 && modprobe max31730
>=20
>  BUG: unable to handle page fault for address: ffffffffc053d860
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  Oops: 0000 [#1] PREEMPT SMP KASAN
>  CPU: 0 PID: 3752 Comm: modprobe Tainted: G
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>  RIP: 0010:i2c_default_probe (drivers/i2c/i2c-core-base.c:2259) i2c_core
>  RSP: 0018:ffff888107477710 EFLAGS: 00000246
>  ...
>  <TASK>
>   i2c_detect (drivers/i2c/i2c-core-base.c:2302) i2c_core
>   __process_new_driver (drivers/i2c/i2c-core-base.c:1336) i2c_core
>   bus_for_each_dev (drivers/base/bus.c:301)
>   i2c_for_each_dev (drivers/i2c/i2c-core-base.c:1823) i2c_core
>   i2c_register_driver (drivers/i2c/i2c-core-base.c:1861) i2c_core
>   do_one_initcall (init/main.c:1296)
>   do_init_module (kernel/module/main.c:2455)
>   ...
>  </TASK>

Applied to for-current, thanks!


--otMN8fDUrbC6X6ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhEQ4ACgkQFA3kzBSg
KbauaA/+MW0pMRkolqVq0BcOSMcyMQAPeYd+gJk/+dpqv+/19KY+mtiZWyqlF2D7
faJTYGU+wvuPzScNrkw5IbWZ48sNA02mvCtnxXZqQJqDP11c70F/qWa3azqMLB0d
dzdjKs+JagGTY5gDB0il0uuxxjUL0xXQcDJ5ZrOwGaYaZKUZ/ply9C2EK/3XUCvg
9SzROVLGlpXhcVk16X7yh9YbdtfBQyGuh27HC/WgaCgb3bRmvLwAkOCz+GRGABB+
QFse8hdYw5qnDaKI5dSumbeOTe+d4TkRKOu+s8d3qr2Cct/f2Hb4avG8FVjOiNms
lCnUr78siu2CRg95MrCsbPToC9MQrUaXjl9MZmGTAj4oE5kW30x8zgQgu8ZfQ4DU
KiSYVkA7vKSUgTj8CKQQsrbE2lHLLrfFOWw9VaM4AjEFhGb5YSCTTPnb9hX778lh
zW5YuCiYJT6j214MrxI1Vd9o0GRSsKCOsIHPPZ7v4ACWLupv4sIz/9G36lzKSHR+
PhVTonPPDqxvkq4cMXAOEfY7+oCI03Kk0ilx5ndT/mWCNDnSTkRcYmSoZhkJtoRp
klbjC2YKwlgv4iCKBOHhmjnkDmgeAn8Pa4BJA+Kcio/rxx5L6PIStvJ2BPm+LUn4
JcIDn7MIW18HK2hPhwYv8xM3KDF9VqYJ/0NqPIXIP8eOuubV2Os=
=m4QC
-----END PGP SIGNATURE-----

--otMN8fDUrbC6X6ca--
