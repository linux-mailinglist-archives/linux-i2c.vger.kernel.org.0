Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A715616E90
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 21:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiKBUYi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 16:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiKBUYf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 16:24:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DAB6332;
        Wed,  2 Nov 2022 13:24:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5119BB82482;
        Wed,  2 Nov 2022 20:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7852C433D6;
        Wed,  2 Nov 2022 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667420670;
        bh=P2RrF7ZDcywsh3NTY5quC75kZS0zCiqXiLHnJ7EZcd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OfLQHd8reqiLjVGoh0SXOJf5NyMMO/IIuERDI3Yhh3q+hcv9cZJNYCLDgJoo42Si4
         rC5GBrZqtpRlBgidLADsT9E+5XTKVd7q7RTpY/wzsWlLI4kyhtK2n1fxkwflp4aMod
         tzTvV9k4I36gLzLfVFp/qdYjaqQrnGokSuQJFFT7K7fuxyUD2RjbGyveMGQX21OON6
         T9n0IEhTJtCrMN6MSim+Iw2DL8EKb9upHbEDcRm6M4zuFTbOFbz22qjeO35LvVmb31
         9Xsyi4vmEAcZyVbjLihayfcmdYE5hlfpOJhantuUnTUVCyi3eAxdp0bw7tisc2/oUs
         7DTFkKCbkxlLw==
Date:   Wed, 2 Nov 2022 21:24:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v10 2/2] dt-bindings: i2c: add entry for
 hisilicon,ascend910-i2c
Message-ID: <Y2LR+2NPNy7iW9o/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101080728.143639-1-chenweilong@huawei.com>
 <20221101080728.143639-2-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yCMZ0rD5+5Z8nzlG"
Content-Disposition: inline
In-Reply-To: <20221101080728.143639-2-chenweilong@huawei.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yCMZ0rD5+5Z8nzlG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 04:07:28PM +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon i2c.
>=20
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--yCMZ0rD5+5Z8nzlG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNi0fsACgkQFA3kzBSg
KbbMSQ//QQwyU8+oIWyoT5zabPsxftjec8ylrqwNUx6q7kssNSu4HZVGSHcJy0h9
9UXnzhyxBsmyP/csgkpXh3i5BpDUZG4uWiilOexP7ujnZSrF4eUoNkKLaPAu72vH
3wHouXBD3hLQbVfxetnfXyxib89zCH1mxJXQZav3HQ1p3lcVjS28yL2+4v3XOj3w
7kNJPVqaSftZgfZkOR6CM5hh+Ssi+/8U8TswBZ8B+uyIS3iqG+3Pfywkl4ibiJhT
whHMaPLndh03JRpqq4FgGL6Bmlv+E6HCU+ukrMSdZRZEB8LX83sb4SpBXegWHPFv
JfGaFEY6G2N34GfvOJcyo1UiIJbEeik9u/eJfd3biKSvfaciIgxUSwt3u9hc/ccZ
QkFN1hIPgAzDasx4lsj0f7QnscJ3YJ+Hx93NWMSPPDnARG/bBOr/uM5D28pGemxk
wAZKwNpHo9NWL7MyGtaZc5rbC9JJrNtEjY6CJ8EoQKV62oWHw9JHqwlvPXNz3dO2
MmshfOu4Sx63qluuoESS3D/WqguptjP/TAEdnkotLrlpFUgepSvTXjlYl5aKYk/x
0dDnkc+GuDZ4xxDFXBw5CPK83lq4r9EHs5M83m0vtj0Lo2TtOodfKzklE+tQEQmd
PD3gf9293J9M7klIT/VHZn7kcNWKVwCx0nmWxePan3jz3qlzFog=
=cao+
-----END PGP SIGNATURE-----

--yCMZ0rD5+5Z8nzlG--
