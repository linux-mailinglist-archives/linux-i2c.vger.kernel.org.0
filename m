Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B4669E158
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbjBUNco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbjBUNcm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:32:42 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96F529403;
        Tue, 21 Feb 2023 05:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986360; x=1708522360;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dwekOLpeD7dbZLdg6HiXsba5bh5a3r4w9ULUX42d/IQ=;
  b=Q35N1+5rCUE5rZCgFr5uRXPf+sAeuGbUcyJpAPz7BtJTUIACY1jh7Gsx
   5spmJWtiJ3G4Mez1Olze7Xfk80BQ5Jdi1VggTMF+7Sb7SEUjsd2aF3dKu
   7bEBlVsl7DTFRcdEy7oDvA8qvEqRpsGDQjLEKDQO0JG07UhkhdJnssI7T
   Fs/5wFtmdhSIiuDN+HlxXvJtOdO++c1h04TX3/NFjMK7oNwGry2eMbWL8
   8uSq6MTMuvhCbHP/mmvHYeCf+uVvFpVqBUaFXnmhVKL4tolKAOfROyQ2s
   Y8/orCptJxV3FTr8Gilhlr4tRA1IUMTLt48UsMHZV1sIzfYoeEetAkLC7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333990922"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333990922"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="649178419"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649178419"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 05:32:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CBA82154; Tue, 21 Feb 2023 15:33:09 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 0/3] i2c: stop using i2c_of_match_device()
Date:   Tue, 21 Feb 2023 15:33:04 +0200
Message-Id: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_of_match_device() is used by core and a couple of drivers.
Instead, convert those drivers to use device_get_match_data()
and unexport i2c_of_match_device().

Andy Shevchenko (3):
  usb: typec: stusb160x: Make use of device_get_match_data()
  auxdisplay: ht16k33: Make use of device_get_match_data()
  i2c: Unexport i2c_of_match_device()

 drivers/auxdisplay/ht16k33.c  | 15 ++++++++++-----
 drivers/i2c/i2c-core-of.c     |  1 -
 drivers/i2c/i2c-core.h        |  9 +++++++++
 drivers/usb/typec/stusb160x.c |  8 ++++----
 include/linux/i2c.h           | 11 -----------
 5 files changed, 23 insertions(+), 21 deletions(-)

-- 
2.39.1

