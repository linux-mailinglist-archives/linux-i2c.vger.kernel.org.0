Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F42B57BE2F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 21:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbiGTTBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 15:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbiGTTBe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 15:01:34 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6104D52459;
        Wed, 20 Jul 2022 12:01:32 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 75so33717115ybf.4;
        Wed, 20 Jul 2022 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=58fU8wz/MRnYVvG9hVkJSefKiSbVO5jpOlOekUHdxyg=;
        b=h7nZiQLWtuuGLQegQZonr3M3nE9fcED2laPjzMO5ZELylj09nTCLfzfRjGYHCOt7dx
         qbn2/HRiFKBqFhcoTNaM0C1B6wpD13nMZuP0sFbi5cVYDnHI0igdex6RCFQVCa7hj0B8
         02M4oGZuTCcdXUM2UbXHSmUvRjoByDJCUxUUNEVncCQDNEZCMIOul7fCctFS1LOhUGqf
         ShGgbAgEll+kQCf5R4Dpqlma0/aJsmheI8bWXiqJvQsjcmiM8wFdmxxq9dQe6na8Ahyc
         un2XyyIksiw+B/VU8MtYatjEoN8ksuRUpRkx1QFzJPHV972Sipa+urv96R6qOYN+rR+T
         6uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=58fU8wz/MRnYVvG9hVkJSefKiSbVO5jpOlOekUHdxyg=;
        b=OIkOUC6LPjoCJMcd4DpD6co9hC6JJIpfn35reS8dgoIFX4XLH1hQg+js6WIvddbrCc
         2FAMfzRPU+QMLAQ4KpTfimMKmzeE6WuavToggIvzWFseYWbERXdQkga/zw0ncmGao0WF
         KOt4m0rws8TYxo0g4OTMP9OgKoq/1p0AWeV34kFsroy8dLHNBwmlriRfU1/lpdlGA0aJ
         FuS0sbnqOueuOMIcw428SDdaWyoZwMAXs8n4ARPBkZdTsbCo2Aju9h2IvH+fK3t/lUmF
         UBS1P72BabtHGD4+iLDXo39NQdlrTKchDrt0oZiXMla6XNdJM0XCNbpbrN73lsArZB0X
         BZxw==
X-Gm-Message-State: AJIora+8At1LmOXN9YP/8hhUOYBf4qdqMAwbmE3t4CXYJBQM/nURpl1j
        FlhsHYR+TEt+/p+nr5dS8Z+q7UOAGw7S7P3fzF8=
X-Google-Smtp-Source: AGRyM1uVeEJi1uHSegCvL2QEAIGtzs0Hkr4/MDo5cVfn1Gk7cXF30CvO11Cp6R8nVAll9uv7Of/9yA1x+AmmeaeMnag=
X-Received: by 2002:a05:6902:38a:b0:670:aa12:8908 with SMTP id
 f10-20020a056902038a00b00670aa128908mr2463061ybs.446.1658343691973; Wed, 20
 Jul 2022 12:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <202207190634.ToyhlXSz-lkp@intel.com> <0551a3ad-8c42-78fe-5b50-ebbc003e55e6@intel.com>
In-Reply-To: <0551a3ad-8c42-78fe-5b50-ebbc003e55e6@intel.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Wed, 20 Jul 2022 12:01:35 -0700
Message-ID: <CANRwn3R48rvwnygdyKhmFE8wD+BCCHrTWa-M=uTvpnK5Jo3vww@mail.gmail.com>
Subject: Re: [PATCH] i2c: Use u8 type in i2c transfer calls
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-iio@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 19, 2022 at 5:21 PM kernel test robot <rong.a.chen@intel.com> w=
rote:
>
>
> Hi Jason,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on wsa/i2c/for-next]
> [also build test ERROR on linus/master v5.19-rc7 next-20220718]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Jason-Gerecke/i2c-Use-u8-t=
ype-in-i2c-transfer-calls/20220718-233658
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> i2c/for-next
> config: hexagon-randconfig-r026-20220718
> (https://download.01.org/0day-ci/archive/20220719/202207190634.ToyhlXSz-l=
kp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project
> d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
> reproduce (this is a W=3D1 build):
>          wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          #
> https://github.com/intel-lab-lkp/linux/commit/9732240c23a365c0590f05ce831=
96869235a2ea7
>          git remote add linux-review https://github.com/intel-lab-lkp/lin=
ux
>          git fetch --no-tags linux-review
> Jason-Gerecke/i2c-Use-u8-type-in-i2c-transfer-calls/20220718-233658
>          git checkout 9732240c23a365c0590f05ce83196869235a2ea7
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/iio/adc/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/iio/adc/max1363.c:1645:12: error: incompatible function pointe=
r types assigning to 'int (*)(const struct i2c_client *, const char *, int)=
' from 'int (const struct i2c_client *, const u8 *, int)' (aka 'int (const =
struct i2c_client *, const unsigned char *, int)') [-Werror,-Wincompatible-=
function-pointer-types]
>                     st->send =3D i2c_master_send;
>                              ^ ~~~~~~~~~~~~~~~
> >> drivers/iio/adc/max1363.c:1646:12: error: incompatible function pointe=
r types assigning to 'int (*)(const struct i2c_client *, char *, int)' from=
 'int (const struct i2c_client *, u8 *, int)' (aka 'int (const struct i2c_c=
lient *, unsigned char *, int)') [-Werror,-Wincompatible-function-pointer-t=
ypes]
>                     st->recv =3D i2c_master_recv;
>                              ^ ~~~~~~~~~~~~~~~
>     2 errors generated.

Wolfram and Jonathan,

Writing a patch to fix the new warnings generated by my I2C patch is
simple enough, but I'd like some help coordinating getting both
patches landed. Should I wait for the I2C patch to land in "for-next"
before sending the IIO fix, or would it be preferred to send the IIO
fix right now so that both patches can be reviewed simultaneously?
