Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5915676B2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 20:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbiGESko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 14:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiGESkm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 14:40:42 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBFE1EED0;
        Tue,  5 Jul 2022 11:40:42 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id e80so16159611ybb.4;
        Tue, 05 Jul 2022 11:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqMD43+h/87sPcXJb6GKl/p0e47Kr5belhpvXQpn74s=;
        b=4oKz4NzIf0rd5c6TetCJQyRSyEqcJ6iJnmhtELdzJcYp3fIHKcIAfd+k1r1IFuCt0A
         /LEu1oQg2r2J5fmSoXhHPE4fIrviq7xogJY9f13LNVBCVPq+Jgi/EmZsFgFUhtN9aB68
         0i37lpENNH2NO1hcgOLgR9FS/1Wkbm1/mmpd5OCGSkB6VyNW4Mx3hErx3ad+Ldw8z40h
         CYL0MOZWVhwRY6p58jo5nbv773uO506zKj3dROiifCxIqMTZDi9ndh/Dh87gXUgUnnAZ
         3ZgvtDdaEr6nxGySDdUqZ/wZawudZXArFgyjdcRCfpEOAA9wZYDvgHZBegfN33oJNLYx
         LjAw==
X-Gm-Message-State: AJIora+JTFNuhW1Ic4IKyaOUxl8KG6i3N/6INyGWnG3ImPmh02G9E2Nl
        3RDT+tbnp4IHh7ZfK0rcByLvydc/2HdzfOJBZfs=
X-Google-Smtp-Source: AGRyM1tbU/Q+q1ShqafHYay3V0ImixKEkCcZMfKVWC5BCMMJBAokfuIlMUsuMGcKwepW0ljsXp1WT9XSsRibnwbpG2A=
X-Received: by 2002:a25:6b50:0:b0:64f:4b33:664 with SMTP id
 o16-20020a256b50000000b0064f4b330664mr41056762ybm.153.1657046441354; Tue, 05
 Jul 2022 11:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com> <Yr6KcPlC/3rYAtKE@lahna>
In-Reply-To: <Yr6KcPlC/3rYAtKE@lahna>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 5 Jul 2022 20:40:30 +0200
Message-ID: <CAJZ5v0ht6hfaBsifhr=M_htHh6uHohwgcab2dFR5hqq4rO+xFQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] ACPI: utils: Introduce acpi_match_video_device_handle()
 helper
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 1, 2022 at 7:47 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi Andy,
>
> On Fri, Jul 01, 2022 at 12:28:15AM +0300, Andy Shevchenko wrote:
> >  extern long acpi_is_video_device(acpi_handle handle);
> > +extern bool acpi_match_video_device_handle(acpi_handle handle);
>
> I think we can do slightly better here. The only caller of
> acpi_is_video_device() is in drivers/acpi/video_detect.c so we can move
> it there and make it static (is_video_device()).
>
> Then we can name this one acpi_is_video_device() instead and in addition
> make it take struct acpi_device as parameter instead of acpi_handle (I
> think we should not use acpi_handles in drivers if possible).

Agreed.
