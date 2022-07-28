Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A2158410B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jul 2022 16:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiG1OZr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jul 2022 10:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbiG1OZq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jul 2022 10:25:46 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CBC3C144;
        Thu, 28 Jul 2022 07:25:45 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 141so3518302ybn.4;
        Thu, 28 Jul 2022 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p3LundJe/B7kP70p/sHLOn4E+FS4l10QjqFmK00htFE=;
        b=A1npVQRsIIGhqrLf8k1afl0RnpwTJqtndWJ9zwwdiHBec1qyAdFLwzqHsOSEz3tCvV
         J33JylIt6+Pd/jdRlsNR8UNmRloDG3G3NH8SDxk+u/mKNySVTad5ytB99iquy75NDEmJ
         4mWC5CLDqVkcs4L2XoIG3yXXPEAHHG/8Tcg/Dvv9GYAPEUkBT69Sf5SENvQPZzOzH0sX
         rfGEF5dzUYaNlMOHu9Bo+MhNb46gjzqbFsnt6Os5CtChAsnh8Oe9HHUf8ZzIl+foGeav
         4tev6dNQXoIBnvQvDpzSxoDwu4FxCVkjoAtNixqsdq3d7+awDvcxDaofyreOs9jcFNbc
         pM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p3LundJe/B7kP70p/sHLOn4E+FS4l10QjqFmK00htFE=;
        b=6RF8NVyqer2ry7KkMbl4IGe3s466k9oAtT8aexLm+GyWJ8LGxFSmOwyN77/S38+3c1
         fKKwh2CnoBJL8cg15hV7rxdNiwuSvH+rPXrZGZntlbgnmWQ4y7yi4yAx5kFspcdVe0pr
         +pByPs6GHVdjawPpGZV0FuOoHi0L5tU0q2NfKxxMibBhfWpUr5HDe5XVX9U5lF6ZadYw
         /qHuBuHuM2yrtiLfokOHvCGQXCqontHwfRxWYG/FcKKacSIVP9tleGsyDrOCvm/DeoYR
         b+ucXBpRe03WGawwrsk6EXEOzdEoKDGs0tPFSDZgFbEIq6qDVPpJrJBzhBd4JliSP5kO
         CUjA==
X-Gm-Message-State: AJIora9AUiv+GEFNUaem3B7qlfBZvrywD5GTOgrdxToXQkTak2+zIN/G
        dB1ZendnebimntracZRkcoXk8sTco+kdtkssDs0=
X-Google-Smtp-Source: AGRyM1tCj4kGBTNXRwFwSGAlKun9Kno3+3NAkIfxjL5nye0CiOrWdeD4Is2ry7fRDFK14XMZzZ9IWnwfFJOA1A028zM=
X-Received: by 2002:a25:e401:0:b0:66e:280a:98cd with SMTP id
 b1-20020a25e401000000b0066e280a98cdmr20245601ybh.540.1659018344244; Thu, 28
 Jul 2022 07:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <202207190634.ToyhlXSz-lkp@intel.com> <0551a3ad-8c42-78fe-5b50-ebbc003e55e6@intel.com>
 <CANRwn3R48rvwnygdyKhmFE8wD+BCCHrTWa-M=uTvpnK5Jo3vww@mail.gmail.com>
In-Reply-To: <CANRwn3R48rvwnygdyKhmFE8wD+BCCHrTWa-M=uTvpnK5Jo3vww@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Thu, 28 Jul 2022 07:26:00 -0700
Message-ID: <CANRwn3Tgumg-mZ9sV=8AXevag9z2s=mTF4qqZW2KenDmc9b1wQ@mail.gmail.com>
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

On Wed, Jul 20, 2022 at 12:01 PM Jason Gerecke <killertofu@gmail.com> wrote=
:
>
> On Tue, Jul 19, 2022 at 5:21 PM kernel test robot <rong.a.chen@intel.com>=
 wrote:
> >
> >
> > Hi Jason,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on wsa/i2c/for-next]
> > [also build test ERROR on linus/master v5.19-rc7 next-20220718]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:
> > https://github.com/intel-lab-lkp/linux/commits/Jason-Gerecke/i2c-Use-u8=
-type-in-i2c-transfer-calls/20220718-233658
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> > i2c/for-next
> > config: hexagon-randconfig-r026-20220718
> > (https://download.01.org/0day-ci/archive/20220719/202207190634.ToyhlXSz=
-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project
> > d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
> > reproduce (this is a W=3D1 build):
> >          wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cros=
s
> > -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          #
> > https://github.com/intel-lab-lkp/linux/commit/9732240c23a365c0590f05ce8=
3196869235a2ea7
> >          git remote add linux-review https://github.com/intel-lab-lkp/l=
inux
> >          git fetch --no-tags linux-review
> > Jason-Gerecke/i2c-Use-u8-type-in-i2c-transfer-calls/20220718-233658
> >          git checkout 9732240c23a365c0590f05ce83196869235a2ea7
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1
> > O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/iio/adc/
> >
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/iio/adc/max1363.c:1645:12: error: incompatible function poin=
ter types assigning to 'int (*)(const struct i2c_client *, const char *, in=
t)' from 'int (const struct i2c_client *, const u8 *, int)' (aka 'int (cons=
t struct i2c_client *, const unsigned char *, int)') [-Werror,-Wincompatibl=
e-function-pointer-types]
> >                     st->send =3D i2c_master_send;
> >                              ^ ~~~~~~~~~~~~~~~
> > >> drivers/iio/adc/max1363.c:1646:12: error: incompatible function poin=
ter types assigning to 'int (*)(const struct i2c_client *, char *, int)' fr=
om 'int (const struct i2c_client *, u8 *, int)' (aka 'int (const struct i2c=
_client *, unsigned char *, int)') [-Werror,-Wincompatible-function-pointer=
-types]
> >                     st->recv =3D i2c_master_recv;
> >                              ^ ~~~~~~~~~~~~~~~
> >     2 errors generated.
>
> Wolfram and Jonathan,
>
> Writing a patch to fix the new warnings generated by my I2C patch is
> simple enough, but I'd like some help coordinating getting both
> patches landed. Should I wait for the I2C patch to land in "for-next"
> before sending the IIO fix, or would it be preferred to send the IIO
> fix right now so that both patches can be reviewed simultaneously?

It's been pretty quiet, so asking again for any thoughts on how to
best address this tangle...

Jason
