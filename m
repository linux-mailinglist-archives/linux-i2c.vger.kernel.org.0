Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D1F51ED21
	for <lists+linux-i2c@lfdr.de>; Sun,  8 May 2022 12:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiEHKyp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 May 2022 06:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbiEHKyj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 May 2022 06:54:39 -0400
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D3239A;
        Sun,  8 May 2022 03:50:49 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id 49F423002C27F;
        Sun,  8 May 2022 12:50:47 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 3E4C228DC2F; Sun,  8 May 2022 12:50:47 +0200 (CEST)
Date:   Sun, 8 May 2022 12:50:47 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 1/8] platform/x86/intel: Add Primary to Sideband
 (P2SB) bridge support
Message-ID: <20220508105047.GA28082@wunner.de>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
 <20220505145503.GA25423@wunner.de>
 <CAHp75VdQqQj0fS6t5nYj+7rJ1tuSt7+5GT78eN06PShWnrDZgA@mail.gmail.com>
 <20220508071308.GA27815@wunner.de>
 <CAHp75Vfy3Z0+YmPucL=xbP9tiSL6jM34mJ5-fK=og91eEzq5hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfy3Z0+YmPucL=xbP9tiSL6jM34mJ5-fK=og91eEzq5hw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 08, 2022 at 12:05:53PM +0200, Andy Shevchenko wrote:
> On Sun, May 8, 2022 at 9:13 AM Lukas Wunner <lukas@wunner.de> wrote:
> > pci_lock_rescan_remove() prevents concurrent unhiding as well as
> > removal via sysfs.
> 
> Yep, that's good. In any case this piece of code will be gone if your
> above suggestion works, have I got it right?

Yes.  You just need to make sure that you call pci_scan_single_device()
*after* unhiding the P2SB device so that this check succeeds:

  pci_scan_single_device()
    pci_scan_device()
      pci_bus_read_dev_vendor_id()

Thanks,

Lukas
