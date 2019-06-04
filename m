Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 074E234320
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 11:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfFDJ1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 05:27:25 -0400
Received: from mga06.intel.com ([134.134.136.31]:44224 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbfFDJ1Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 05:27:25 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 02:27:23 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 04 Jun 2019 02:27:20 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Jun 2019 12:27:20 +0300
Date:   Tue, 4 Jun 2019 12:27:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH 22/57] drivers: i2c: Use generic helper to match
 device by acpi_dev
Message-ID: <20190604092720.GO2781@lahna.fi.intel.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
 <1559577023-558-23-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559577023-558-23-git-send-email-suzuki.poulose@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 03, 2019 at 04:49:48PM +0100, Suzuki K Poulose wrote:
> Switch to the generic helper to match device by acpi_dev.

It would be nice if you had Cc'd actual implementation of
device_match_acpi_dev() as well but if it looks like
i2c_acpi_find_match_device() then this is fine by me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
