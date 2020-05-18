Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0857D1D758B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 12:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgERKsz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 06:48:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:38816 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgERKsz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 06:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=se2KzvZEGwK7ZejY8a1rYt7R+rHK
        CibdrXAU1LY5p3k=; b=Q7bSJwD/fF1y0CTRKugGWszC6kjjp1uxJSby/tOJtSKg
        Kdgl7YdGHz5avZVowNpXEXnayWEsXWpkt9TbSA6o9kixrmNfYaIX1r+YlN//LGv2
        xf3YTh0Gv9CH2LfSBX7qne47p+cH83KdnCFXsia4duG4Or58CWsOdWBUPVEJAtg=
Received: (qmail 980286 invoked from network); 18 May 2020 12:48:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 May 2020 12:48:51 +0200
X-UD-Smtp-Session: l3s3148p1@qFuY6OmlAKIgAwDPXwfCAIWBZdj99x2z
Date:   Mon, 18 May 2020 12:48:51 +0200
From:   Wolfram Sang <wsa-dev@sang-engineering.com>
To:     kbuild test robot <lkp@intel.com>, Qii Wang <qii.wang@mediatek.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [wsa:i2c/for-next] BUILD REGRESSION
 41895bfee70e7b8a5af7deae458fbf02c1fe782a
Message-ID: <20200518104851.GE3268@ninjato>
References: <5ebf3670.uIi3PwYqAckNzmnl%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline
In-Reply-To: <5ebf3670.uIi3PwYqAckNzmnl%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Adding patch author to CC.

Hi Qii Wang,

can you send an incremental patch to replace the 64-bit division with
either do_div() or some apropriate div64_* function?

While there, it might also be good to double check if the divisor is
always non-zero to prevent "division by zero" OOPSes, if you haven't
done this already.

Thanks,

   Wolfram


On Sat, May 16, 2020 at 08:40:16AM +0800, kbuild test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.gi=
t  i2c/for-next
> branch HEAD: 41895bfee70e7b8a5af7deae458fbf02c1fe782a  Merge branch 'i2c/=
for-current-fixed' into i2c/for-next
>=20
> Error/Warning in current branch:
>=20
> arm-linux-gnueabi-ld: i2c-mt65xx.c:(.text+0xa34): undefined reference to =
`__aeabi_ldivmod'
> i2c-mt65xx.c:(.text+0x3e5): undefined reference to `__divdi3'
> i2c-mt65xx.c:(.text+0x532): undefined reference to `__divdi3'
> i2c-mt65xx.c:(.text+0x5d2): undefined reference to `__divdi3'
> i2c-mt65xx.c:(.text+0x9ac): undefined reference to `__aeabi_ldivmod'
> i2c-mt65xx.c:(.text.mtk_i2c_calculate_speed+0x2d4): undefined reference t=
o `__divdi3'
> ld: i2c-mt65xx.c:(.text+0x60f): undefined reference to `__divdi3'
> m68k-linux-ld: i2c-mt65xx.c:(.text+0x57e): undefined reference to `__divd=
i3'
> mips-linux-ld: i2c-mt65xx.c:(.text.mtk_i2c_calculate_speed+0x368): undefi=
ned reference to `__divdi3'
>=20
> Error/Warning ids grouped by kconfigs:
>=20
> recent_errors
> |-- arm-allyesconfig
> |   |-- arm-linux-gnueabi-ld:i2c-mt65xx.c:(.text):undefined-reference-to-=
__aeabi_ldivmod
> |   `-- i2c-mt65xx.c:(.text):undefined-reference-to-__aeabi_ldivmod
> |-- h8300-allyesconfig
> |   `-- i2c-mt65xx.c:(.text):undefined-reference-to-__divdi3
> |-- i386-allyesconfig
> |   |-- i2c-mt65xx.c:(.text):undefined-reference-to-__divdi3
> |   `-- ld:i2c-mt65xx.c:(.text):undefined-reference-to-__divdi3
> |-- m68k-allyesconfig
> |   |-- i2c-mt65xx.c:(.text):undefined-reference-to-__divdi3
> |   `-- m68k-linux-ld:i2c-mt65xx.c:(.text):undefined-reference-to-__divdi3
> `-- mips-allyesconfig
>     |-- i2c-mt65xx.c:(.text.mtk_i2c_calculate_speed):undefined-reference-=
to-__divdi3
>     `-- mips-linux-ld:i2c-mt65xx.c:(.text.mtk_i2c_calculate_speed):undefi=
ned-reference-to-__divdi3
>=20
> elapsed time: 482m
>=20
> configs tested: 109
> configs skipped: 3
>=20
> arm                                 defconfig
> arm                              allyesconfig
> arm                              allmodconfig
> arm                               allnoconfig
> arm64                            allyesconfig
> arm64                               defconfig
> arm64                            allmodconfig
> arm64                             allnoconfig
> sparc                            allyesconfig
> m68k                             allyesconfig
> mips                             allyesconfig
> arm                         at91_dt_defconfig
> arm                           sama5_defconfig
> arm                        realview_defconfig
> arm                       spear13xx_defconfig
> powerpc                     pq2fads_defconfig
> c6x                        evmc6678_defconfig
> parisc                              defconfig
> arm                            u300_defconfig
> powerpc                         ps3_defconfig
> arm                         bcm2835_defconfig
> arm                           spitz_defconfig
> arm                           tegra_defconfig
> i386                             allyesconfig
> i386                                defconfig
> i386                              debian-10.3
> i386                              allnoconfig
> ia64                             allmodconfig
> ia64                                defconfig
> ia64                              allnoconfig
> ia64                             allyesconfig
> m68k                             allmodconfig
> m68k                              allnoconfig
> m68k                           sun3_defconfig
> m68k                                defconfig
> nios2                               defconfig
> nios2                            allyesconfig
> openrisc                            defconfig
> c6x                              allyesconfig
> c6x                               allnoconfig
> openrisc                         allyesconfig
> nds32                               defconfig
> nds32                             allnoconfig
> csky                             allyesconfig
> csky                                defconfig
> alpha                               defconfig
> alpha                            allyesconfig
> xtensa                           allyesconfig
> h8300                            allyesconfig
> h8300                            allmodconfig
> xtensa                              defconfig
> arc                                 defconfig
> arc                              allyesconfig
> sh                               allmodconfig
> sh                                allnoconfig
> microblaze                        allnoconfig
> mips                              allnoconfig
> mips                             allmodconfig
> parisc                            allnoconfig
> parisc                           allyesconfig
> parisc                           allmodconfig
> powerpc                             defconfig
> powerpc                          allyesconfig
> powerpc                          rhel-kconfig
> powerpc                          allmodconfig
> powerpc                           allnoconfig
> i386                 randconfig-a006-20200515
> i386                 randconfig-a005-20200515
> i386                 randconfig-a003-20200515
> i386                 randconfig-a001-20200515
> i386                 randconfig-a004-20200515
> i386                 randconfig-a002-20200515
> i386                 randconfig-a012-20200515
> i386                 randconfig-a016-20200515
> i386                 randconfig-a014-20200515
> i386                 randconfig-a011-20200515
> i386                 randconfig-a013-20200515
> i386                 randconfig-a015-20200515
> x86_64               randconfig-a005-20200515
> x86_64               randconfig-a003-20200515
> x86_64               randconfig-a006-20200515
> x86_64               randconfig-a004-20200515
> x86_64               randconfig-a001-20200515
> x86_64               randconfig-a002-20200515
> riscv                            allyesconfig
> riscv                             allnoconfig
> riscv                               defconfig
> riscv                            allmodconfig
> s390                             allyesconfig
> s390                              allnoconfig
> s390                             allmodconfig
> s390                                defconfig
> x86_64                              defconfig
> sparc                               defconfig
> sparc64                             defconfig
> sparc64                           allnoconfig
> sparc64                          allyesconfig
> sparc64                          allmodconfig
> um                               allmodconfig
> um                                allnoconfig
> um                               allyesconfig
> um                                  defconfig
> x86_64                                   rhel
> x86_64                               rhel-7.6
> x86_64                    rhel-7.6-kselftests
> x86_64                         rhel-7.2-clear
> x86_64                                    lkp
> x86_64                              fedora-25
> x86_64                                  kexec
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7CaA8ACgkQFA3kzBSg
KbaPDBAAm2D08g/2pc9wBaSEDkp6oxDtjHroBwwWeJdXmrBbWohvXVNd9NFTEzCK
jsFkNq9dBox9GXueZhY7ehzvfVpbWWh8f24wsyqcd4e/gLLSe0/cVlV9YwVVAhVx
uSX6Eg6YKyUi21XEfpsdkHuCcESdCaszt7FLYprLPIdv+Jzg1HZG/LeQqcyucllF
qas0kgXxPfvhjJ4fr4NJnF77VPDitgtHCd7CnC9SURgDV+TiW5jArqM6tJt/m1YM
+MosnSXGRLmeiEBG636fgGYKHkIyATbeXxKzaGg69l7U1rKs1PLGkEfues7NgfSs
skeQWlLbStHeUKT0bsZN5+diJMYMIFSpyMYV8O7Bg++hErGknPtukJgiqLgi5Puq
QuE4zadCZi5HNT3ZpEcd2wRbDGe4qqlV0g3xBHiTKAGW5fcqUaZYg/iFSWkwADd4
/d4JrvF65JG6uvfog9nXm9Aw+LBgEjyEES99thFtGPHiytz3GDiOjOTWXyCNCT1m
R8uWi5kYv/1SwownmttfmgvZYxqY0kLAk+RoMMbmdANDyF+B+G6I0dOEuLN8OZAw
+TzcXUBLooagi02nPye+JB4nImVWI2A9bx7xNw9LaAxNWUHPpeAwLuj0rycubUpe
OQOqu4KYCXQJQtfwgKEaidFeFTG3WKgt1ouoIqNc1vSz50wENHc=
=Hjsi
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
