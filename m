Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881D63340E2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 15:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhCJO5e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 09:57:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:51906 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231880AbhCJO5J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Mar 2021 09:57:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7ADF8AD72;
        Wed, 10 Mar 2021 14:57:08 +0000 (UTC)
Date:   Wed, 10 Mar 2021 15:57:07 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: Re: [PATCH v1 1/7] PCI: Introduce pci_bus_*() printing macros when
 device is not available
Message-ID: <20210310155707.122f3a1e@endymion>
In-Reply-To: <20210308122020.57071-2-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210308122020.57071-2-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon,  8 Mar 2021 14:20:14 +0200, Andy Shevchenko wrote:
> In some cases PCI device structure is not available and we want to print
> information based on the bus and devfn parameters. For this cases introduce
> pci_bus_*() printing macros and replace in existing users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pci/probe.c | 12 +++---------
>  include/linux/pci.h |  9 +++++++++
>  2 files changed, 12 insertions(+), 9 deletions(-)
> (...)

Nice.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

(If you introduced a _debug flavor of that, it could probably be used in
drivers/pci/hotplug/pciehp_hpc.c.)

-- 
Jean Delvare
SUSE L3 Support
