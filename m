Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455D12E07E8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 10:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgLVJUN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Dec 2020 04:20:13 -0500
Received: from mga18.intel.com ([134.134.136.126]:35633 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbgLVJUM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Dec 2020 04:20:12 -0500
IronPort-SDR: Fjp7UWtV0T4RHxhYYVvgWvbZVoiWPVSrN/SfhdVuQypeCoTw4Iet6cWv5uJ51Aex3mU2V88aBb
 V+AKufowP8cQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="163565359"
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="163565359"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 01:18:26 -0800
IronPort-SDR: weLU49LO/0kqF7aDBsJaaEar5EVyTMQEMrxjdDyotpzY1DePpzgScMfHN10kCXrdC65F67AIdM
 gIGWQ670zFNA==
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="373225694"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 01:18:24 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 22 Dec 2020 11:18:20 +0200
Date:   Tue, 22 Dec 2020 11:18:20 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Do not print duplicate error when failing to
 register an i2c-client from ACPI
Message-ID: <20201222091820.GA968855@lahna.fi.intel.com>
References: <20201221191300.244648-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221191300.244648-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 21, 2020 at 08:13:00PM +0100, Hans de Goede wrote:
> i2c_new_client_device() already prints an error when it fails. Some
> ACPI tables contain 2 ACPI devices describing the same i2c-client,
> leading to errors like this:
> 
> [    1.620847] i2c i2c-4: Failed to register i2c client MAGN0001:00 at 0x1d (-16)
> [    1.620870] i2c i2c-4: failed to add I2C device MAGN0001:00 from ACPI
> 
> There is nothing we can do about the first -EBUSY error being logged,
> but the second error does not really add any new information, so lets
> drop it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
