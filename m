Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A9E264713
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 15:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730637AbgIJNfG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 09:35:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:50798 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730187AbgIJNda (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 09:33:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C8E25ACAF
        for <linux-i2c@vger.kernel.org>; Thu, 10 Sep 2020 13:33:31 +0000 (UTC)
Date:   Thu, 10 Sep 2020 15:33:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: i2c-tools 4.2 is coming
Message-ID: <20200910153315.706cbe73@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

Almost 2 years since i2c-tools 4.1 was released, I think it's about
time to schedule a new release. I have committed all the pending fixes
and improvements, so except for updating the CHANGES file, I believe we
are good to go.

Until the release, ideally next week, I will only accept bug fixes and
documentation updates. Until then, please give it some testing if you
can, so that any problem if found before the release rather than after.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
