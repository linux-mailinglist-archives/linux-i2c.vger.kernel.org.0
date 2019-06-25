Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB1255080
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 15:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbfFYNip (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 09:38:45 -0400
Received: from mga18.intel.com ([134.134.136.126]:9648 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729365AbfFYNio (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 09:38:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 06:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,416,1557212400"; 
   d="scan'208";a="182887735"
Received: from mylly.fi.intel.com (HELO [10.237.72.194]) ([10.237.72.194])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2019 06:38:37 -0700
Subject: Re: [PATCH] i2c: designware: Add disable runtime pm quirk
To:     AceLan Kao <acelan.kao@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190625083051.30332-1-acelan.kao@canonical.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a3469010-829c-16dc-be83-6fe9b3021530@linux.intel.com>
Date:   Tue, 25 Jun 2019 16:38:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625083051.30332-1-acelan.kao@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/25/19 11:30 AM, AceLan Kao wrote:
> Dell machines come with goodix touchpad IC suffer from the double click
> issue if the Designware I2C adapter enters runtime suspend.
> 
> It's because the goodix re-assert the interrupt if host doesn't read the
> data within 100ms and designware takes a longer time to wake up from
> runtime suspend. In the case, it got a second interrupt during
> resuming, so it thinks it's a double click.
> 
> There is no simple way to fix this, it's a firmware issue and goodix
> agrees to fix this in their firmware on next release, but this issue
> still affects the machines that don't come with an updated firmware. So,
> add a quirk to mark those machines and avoid the designware from
> entering runtime suspend.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=202683
> 
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 30 ++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
I think better place to have this fixed is in 
drivers/hid/i2c-hid/i2c-hid-core.c by forcing the adapter device active 
when communicating with such touchpad.

In that way only bus where touchpad is connected stays active, not all 
and makes sure issue is handled also if that touchpad is ever connected 
to any other I2C adapter than Designware.

I did something similar in the commit 72bfcee11cf8 ("i2c: Prevent 
runtime suspend of adapter when Host Notify is required"). Not exactly 
same issue but similar idea.

By looking at i2c-hid-core.c I saw a few i2c-hid devices have 
I2C_HID_QUIRK_NO_RUNTIME_PM. Could you test how does this Goodix behave 
if only i2c-hid device runtime PM is prevented not I2C adapter?

A very quick test would be to comment out those lines below:

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c 
b/drivers/hid/i2c-hid/i2c-hid-core.c
index 90164fed08d3..bd3e6570c45e 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1156,8 +1156,8 @@ static int i2c_hid_probe(struct i2c_client *client,
  		goto err_mem_free;
  	}

-	if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
-		pm_runtime_put(&client->dev);
+//	if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
+//		pm_runtime_put(&client->dev);

  	return 0;

@@ -1183,8 +1183,8 @@ static int i2c_hid_remove(struct i2c_client *client)
  	struct i2c_hid *ihid = i2c_get_clientdata(client);
  	struct hid_device *hid;

-	if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
-		pm_runtime_get_sync(&client->dev);
+//	if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
+//		pm_runtime_get_sync(&client->dev);
  	pm_runtime_disable(&client->dev);
  	pm_runtime_set_suspended(&client->dev);
  	pm_runtime_put_noidle(&client->dev);

-- 
Jarkko
