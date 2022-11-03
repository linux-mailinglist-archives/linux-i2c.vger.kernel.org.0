Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280A361827F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 16:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiKCPWY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 3 Nov 2022 11:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiKCPWX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 11:22:23 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3242AD6;
        Thu,  3 Nov 2022 08:22:22 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1oqc2r-005OkF-4U; Thu, 03 Nov 2022 16:22:17 +0100
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1oqc2q-0056qL-Hz; Thu, 03 Nov 2022 16:22:16 +0100
Message-ID: <cc8a0aa304a15fbdf2f433f98c645b7e962450f1.camel@inka.de>
Subject: Re: NULL pointer dereferences in hid-mcp2221
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Sven =?ISO-8859-1?Q?Z=FChlsdorf?= <sven.zuehlsdorf@vigem.de>,
        Rishi Gupta <gupt21@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 03 Nov 2022 16:22:15 +0100
In-Reply-To: <20221103121645.jott66kltaz6bljq@mail.corp.redhat.com>
References: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
         <caa425d9-e3a2-3764-6191-b308d94ac549@infradead.org>
         <20221103121645.jott66kltaz6bljq@mail.corp.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2022-11-03 at 13:16 +0100, Benjamin Tissoires wrote:
> On Nov 02 2022, Randy Dunlap wrote:
> > Hi--
> > 
> > [adding linux-input mailing list]
> > 
> > On 10/25/22 00:39, Sven Zühlsdorf wrote:
> > > Hi,
> > > 
> > > I've run into two NULL pointer dereferences when loading the MCP2221 driver.
> > > Initially I observed them running the kernel used by yocto kirkstone
> > > (currently 5.15.68) but can reproduce them with a vanilla 6.1-rc1 as well.
> > > All line numbers below are for hid-mcp2221.c, taken from 6.1-rc1.
> > > 
> > > The first one was easy to identify, in mcp2221_probe line 874 `hdev->hidraw`
> > > was NULL since I compiled the kernel without CONFIG_HIDRAW enabled. Should
> > > CONFIG_HID_MCP2221 perhaps depend on or imply CONFIG_HIDRAW?
> > 
> > Looks to me like it should. Hopefully the HID people can chime in here.
> 
> I actually don't see why this driver (and hid-cp2112.c FWIW) should
> depend on hidraw. To me, the reference to hidraw is just a nicer logging
> message, but I have a hard time understanding how hidraw should be
> involved in the driver, and if it were, how it could not break
> everything.
> 
> So IMO, we should probably change that line from the 2 drivers and
> replace the hidraw part with the hid->id number which is unique.

Exactly. See also
https://lore.kernel.org/linux-input/20220926202239.16379-2-Enrik.Berkhan@inka.de/

Cheers,
Enrik



