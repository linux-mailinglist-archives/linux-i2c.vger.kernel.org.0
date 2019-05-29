Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDA52D4C5
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 06:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbfE2Ecd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 00:32:33 -0400
Received: from smtp79.ord1d.emailsrvr.com ([184.106.54.79]:36368 "EHLO
        smtp79.ord1d.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbfE2Ecd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 00:32:33 -0400
Received: from smtp10.relay.ord1d.emailsrvr.com (localhost [127.0.0.1])
        by smtp10.relay.ord1d.emailsrvr.com (SMTP Server) with ESMTP id B6CFBA00A8;
        Wed, 29 May 2019 00:32:31 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp10.relay.ord1d.emailsrvr.com (localhost [127.0.0.1])
        by smtp10.relay.ord1d.emailsrvr.com (SMTP Server) with ESMTP id AADB3A00C7;
        Wed, 29 May 2019 00:32:31 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1559104351;
        bh=mcOSD+EFum3khj5SinsGaMT/35QO/uxIAir4XZYoT8g=;
        h=Subject:From:Date:To:From;
        b=MHycrVrxakzEDWlvwpHaEBzGrDb0gcYBv9ApqyioUjbKce1xluqS4DT8fIadzptw8
         IRl1TrLl5RXPIf67SKptCbkPOspiI3rsuRPXi76GyPqaFuiwlMGXyjDbrno/IHCVA3
         pHLqbPCmCSJTUTkDfxZ4gPc7UurMZHDHqevfjKWY=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp10.relay.ord1d.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id AF1E5A00A8;
        Wed, 29 May 2019 00:32:30 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 29 May 2019 00:32:31 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <ACF57AF2-51C9-4884-BC65-126221CDAB5B@nh6z.net>
Date:   Tue, 28 May 2019 21:32:29 -0700
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>, wsa@the-dreams.de,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F02ECB35-4999-4B6E-8ACF-4EC4359F4017@nh6z.net>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <716a7b8a-c2f8-a3c4-0b3a-be3cb26a6c12@i2se.com>
 <ACF57AF2-51C9-4884-BC65-126221CDAB5B@nh6z.net>
To:     Stefan Wahren <stefan.wahren@i2se.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On May 28, 2019, at 8:01 PM, Annaliese McDermond <nh6z@nh6z.net> =
wrote:
>=20
>=20
>=20
>> On May 28, 2019, at 12:52 AM, Stefan Wahren <stefan.wahren@i2se.com> =
wrote:

>> Please also check the output of /sys/kernel/debug/clk/clk_summary
>=20
> They=E2=80=99ll come up with the same name in the current code in the =
debug
> output.  I agree this is mildly confusing and I=E2=80=99ll spin =
another version
> of the patch to give them unique clock names in clk_summary.

In v3 of the patch the output of /sys/kernel/debug/clk/clk_summary looks =
like the
following with two i2c devices enabled on the RPi.  Note =
3f804000.i2c_div and=20
3f205000.i2c_div.

                                 enable  prepare  protect                =
                duty
   clock                          count    count    count        rate   =
accuracy phase  cycle
=
--------------------------------------------------------------------------=
-------------------
 otg                                  0        0        0   480000000    =
      0     0  50000
 osc                                  7        7        4    19200000    =
      0     0  50000
    gp2                               1        1        1       32768    =
      0     0  50000
    tsens                             1        1        1     1920000    =
      0     0  50000
    vec                               0        0        0    19200000    =
      0     0  50000
    otp                               0        0        0     4800000    =
      0     0  50000
    timer                             0        0        0     1000002    =
      0     0  50000
    pllh                              4        4        0   855000000    =
      0     0  50000
       pllh_pix_prediv                1        1        0   855000000    =
      0     0  50000
          pllh_pix                    0        0        0    85500000    =
      0     0  50000
       pllh_aux                       1        1        0     3339844    =
      0     0  50000
       pllh_rcal_prediv               1        1        0     3339844    =
      0     0  50000
          pllh_rcal                   0        0        0      333984    =
      0     0  50000
    plld                              3        3        1  2000000024    =
      0     0  50000
       plld_dsi1                      0        0        0     7812501    =
      0     0  50000
       plld_dsi0                      0        0        0     7812501    =
      0     0  50000
       plld_per                       4        4        3   500000006    =
      0     0  50000
          pcm                         1        1        1     1535999    =
      0     0  50000
          gp0                         1        1        1    24999389    =
      0     0  50000
             pll                      1        1        0    98303848    =
      0     0  50000
                codec_clkin           2        2        0    98303848    =
      0     0  50000
                   nadc               1        1        0    12287981    =
      0     0  50000
                      madc            1        1        0     6143991    =
      0     0  50000
                   ndac               1        1        0    12287981    =
      0     0  50000
                      mdac            2        2        0     6143991    =
      0     0  50000
                         bdiv         1        1        0     1535998    =
      0     0  50000
          gp1                         1        1        1    24000094    =
      0     0  50000
          hsm                         0        0        0   163682866    =
      0     0  50000
          uart                        0        0        0    47999625    =
      0     0  50000
       plld_core                      2        2        0   500000006    =
      0     0  50000
          sdram                       0        0        0   166666668    =
      0     0  50000
    pllc                              3        3        1  2400000000    =
      0     0  50000
       pllc_per                       1        1        0  1200000000    =
      0     0  50000
          emmc                        0        0        0   200000000    =
      0     0  50000
       pllc_core2                     0        0        0     9375000    =
      0     0  50000
       pllc_core1                     0        0        0     9375000    =
      0     0  50000
       pllc_core0                     2        2        1  1200000000    =
      0     0  50000
          vpu                         3        3        2   400000000    =
      0     0  50000
             3f804000.i2c_div         1        1        1      100000    =
      0     0  50000
             3f205000.i2c_div         1        1        1      100000    =
      0     0  50000
             aux_spi2                 0        0        0   400000000    =
      0     0  50000
             aux_spi1                 0        0        0   400000000    =
      0     0  50000
             aux_uart                 0        0        0   400000000    =
      0     0  50000
             peri_image               0        0        0   400000000    =
      0     0  50000
    pllb                              2        2        0  2800000012    =
      0     0  50000
       pllb_arm                       1        1        0  1400000006    =
      0     0  50000
    plla                              2        2        0  2400000000    =
      0     0  50000
       plla_ccp2                      0        0        0     9375000    =
      0     0  50000
       plla_dsi0                      0        0        0     9375000    =
      0     0  50000
       plla_per                       0        0        0     9375000    =
      0     0  50000
       plla_core                      1        1        0  1200000000    =
      0     0  50000
          h264                        0        0        0   300000000    =
      0     0  50000
          isp                         0        0        0   300000000    =
      0     0  50000
          v3d                         0        0        0   300000000    =
      0     0  50000
 sc16is752_clk                        1        1        0     1843200    =
      0     0  50000
 dsi1p                                0        0        0           0    =
      0     0  50000
 dsi0p                                0        0        0           0    =
      0     0  50000
 dsi1e                                0        0        0           0    =
      0     0  50000
 dsi0e                                0        0        0           0    =
      0     0  50000
 cam1                                 0        0        0           0    =
      0     0  50000
 cam0                                 0        0        0           0    =
      0     0  50000
 dpi                                  0        0        0           0    =
      0     0  50000
 tec                                  0        0        0           0    =
      0     0  50000
 smi                                  0        0        0           0    =
      0     0  50000
 slim                                 0        0        0           0    =
      0     0  50000
 dft                                  0        0        0           0    =
      0     0  50000
 aveo                                 0        0        0           0    =
      0     0  50000
 pwm                                  0        0        0           0    =
      0     0  50000

--
Annaliese McDermond
nh6z@nh6z.net

