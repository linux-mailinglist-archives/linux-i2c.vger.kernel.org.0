Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2ECD481C29
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 13:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239317AbhL3Mo7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 07:44:59 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33574 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbhL3Mo6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 07:44:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E9FAB81C17;
        Thu, 30 Dec 2021 12:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACB5C36AE9;
        Thu, 30 Dec 2021 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640868295;
        bh=enWxlA05sk8H6+SVUvA7t81w4Ef57j73uglp9xVxFvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lxfGoh3ZbHN/4i0UULxfu7lszaVV/33GnwTMnq8gxOBZregd97Vr7q2N2Z+3dTVvK
         6yzGQDJoD1H3IPktTLxrxjuD2ZipHbCLng4HsHrZm38CXCuel7XT6PqsOPsgRPYUXu
         0GMWtlrneOvlFl+DLrQDYJarH9dRsq8i9WIbNJ9s=
Date:   Thu, 30 Dec 2021 13:44:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 03/12] serdev: Do not instantiate serdevs on boards with
 known bogus DSDT entries
Message-ID: <Yc2pxZXu6e+eAKzE@kroah.com>
References: <20211229231431.437982-1-hdegoede@redhat.com>
 <20211229231431.437982-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229231431.437982-4-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 30, 2021 at 12:14:22AM +0100, Hans de Goede wrote:
> x86 ACPI devices which ship with only Android as their factory image use
> older kernels which do not yet support ACPI serdev enumeration, as such
> the serdev information in their ACPI tables is not reliable.
> 
> For example on the Asus ME176C tablet the serdev describing the Bluetooth
> HCI points to the serdev_controller connected to the GPS and the other way
> around.
> 
> Use the new acpi_quirk_skip_serdev_enumeration() helper to identify
> known boards with this issue and then either abort adding the serdev
> controller (creating a tty cdev instead) or only create the controller
> leaving the instantation of the serdev itself up to platform code.
> 
> In the case where only the serdev controller is created the necessary
> serdevs will instead be instantiated by the
> drivers/platform/x86/x86-android-tablets.c kernel module.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/tty/serdev/core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
