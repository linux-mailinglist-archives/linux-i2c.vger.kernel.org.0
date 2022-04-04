Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACBB4F1CF9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Apr 2022 23:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380532AbiDDV3p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 17:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379402AbiDDRFy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 13:05:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCAF12086;
        Mon,  4 Apr 2022 10:03:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu29so18600074lfb.0;
        Mon, 04 Apr 2022 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JweidwxrjFhAI/2v7P1YrxPew3638Ty2dzeJpVrQWYE=;
        b=I8pC/miIU61OHd5dqRJenQe4iwqEMNWcbRRJquHcwqrA41pIdbn+rDkftP4Wgy8De6
         l2P/kMX+m1AlHndTCFw3I9e8C2PbWnptwDkLhCKGENUjppP00s+oaSpn30odJADOWz80
         gZ8aVgizdoRJMD3T6AeNpo8DIwPDr87SzDVdFiM8OdSG4AmvAn65FA0Q/pYGDN1oIlao
         +YKcox4/vRA3RiBKPCUROakAioTHX5ZKNwEvMn7A4BVVjmQPgHDz09Xezqhs7kUtDDfY
         rUW3RKJYgdzLAkmjcApGuwZWiQMC6aAEsIC1HT66RK9v0vxmMklonMMLr9nzl3HGoQcI
         8TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JweidwxrjFhAI/2v7P1YrxPew3638Ty2dzeJpVrQWYE=;
        b=nWUf9C3SEGVmGBxXGgqgOjKzTw5U8BMB1Ivzx6o7pKMu0Rv2z6cTt1h77mlrzvNYAm
         2sg0tVAYvE5dTv+Rn9I9o1IwcT7k5/9CpbNYE0MFDq6Bo3dgz8gj0CBUd9l7pqHNMzbH
         qZjCwV+PiiemdMDpIQzn+8Nt1mp15MtAvFkIEkX59Xm81fqARBQaSAcKgNiKUDBCnIA9
         MIGr3RQXfyGJUfF7Pn3ifinQ3EaYkL4/Drh6g3JXt3jiwpI5mmV9E4QD6Eu3GcviZyYR
         fwsSi9OspxO/y7ldlyC9hXvXzqFAPUPjpEFX/GMbIqCq1nfhRXn84j496BHrJ2AZ5x3L
         WbkA==
X-Gm-Message-State: AOAM5334RbHfa900H78JbYhacd6y6ejmGa2uu8LQCfFpsEQn/CCixLU+
        6Ek5G9edFNbYcADMYqF4uCVLIYqyTueH/ZS+kzbGOaYq1A==
X-Google-Smtp-Source: ABdhPJyWHkLML0CW+orqZVMU399DWfiqN//krw23FbqOQO+YZ/LLJNNX0j1rbJvWijFJbBpeNZJnAR2Kqa0Pofh74F8=
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr252549lfh.687.1649091835467; Mon, 04 Apr
 2022 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com> <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
 <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
In-Reply-To: <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Mon, 4 Apr 2022 20:03:44 +0300
Message-ID: <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Tyrone Ting <warp5tw@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 3, 2022 at 4:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > > From: Tali Perry <tali.perry1@gmail.com>
> > > > >
> > > > > In order to better handle spurious interrupts:
> > > > > 1. Disable incoming interrupts in master only mode.
> > > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > > 3. Return correct status during interrupt.
> > > >
> > > > This is bad commit message, it doesn't explain "why" you are doing these.
>
> ...
>
> > BMC users connect a huge tree of i2c devices and muxes.
> > This tree suffers from spikes, noise and double clocks.
> > All these may cause spurious interrupts to the BMC.
> >
> > If the driver gets an IRQ which was not expected and was not handled
> > by the IRQ handler,
> > there is nothing left to do but to clear the interrupt and move on.
>
> Yes, the problem is what "move on" means in your case.
> If you get a spurious interrupts there are possibilities what's wrong:
> 1) HW bug(s)
> 2) FW bug(s)
> 3) Missed IRQ mask in the driver
> 4) Improper IRQ mask in the driver
>
> The below approach seems incorrect to me.
>

Andy, What about this explanation:
On rare cases the i2c gets a spurious interrupt which means that we
enter an interrupt but in
the interrupt handler we don't find any status bit that points to the
reason we got this interrupt.
This may be a rare case of HW issue that is still under investigation.
In order to overcome this we are doing the following:
1. Disable incoming interrupts in master mode only when slave mode is
not enabled.
2. Clear end of busy (EOB) after every interrupt.
3. Clear other status bits (just in case since we found them cleared)
4. Return correct status during the interrupt that will finish the transaction.
On next xmit transaction if the bus is still busy the master will
issue a recovery process before issuing the new transaction.
> > If the transaction failed, driver has a recovery function.
> > After that, user may retry to send the message.
> >
> > Indeed the commit message doesn't explain all this.
> > We will fix and add to the next patchset.
> >
> > > > > +     /*
> > > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > > +      * status bits are cleared.
> > > >
> > > > This does not explain why you hide the spurious interrupt.
> > > >
> > > > > +      */
> > > > > +     if (ret == IRQ_NONE) {
> > > > > +             npcm_i2c_eob_int(bus, false);
> > > > > +             npcm_i2c_clear_master_status(bus);
> > > > > +     }
> > > > > +
> > > > > +     return IRQ_HANDLED;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Regards,
Avi
