Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 221E2A6512
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfICJYI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:24:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:53576 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727005AbfICJYI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:24:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4FAE2AC64
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:24:07 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:24:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 6/7] decode-dimms: Fix the version string
Message-ID: <20190903112415.315c4097@endymion>
In-Reply-To: <20190903111706.43f9bc2b@endymion>
References: <20190903111706.43f9bc2b@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We moved away from Subversion long ago, so $Revision$ and $Date$ are
no longer being resolved. Just use the version of i2c-tools itself.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

--- i2c-tools.orig/eeprom/decode-dimms	2019-09-03 10:38:26.287220460 +0200
+++ i2c-tools/eeprom/decode-dimms	2019-09-03 10:41:14.805360317 +0200
@@ -43,14 +43,11 @@ use Fcntl qw(:DEFAULT :seek);
 use File::Basename;
 use vars qw($opt_html $opt_bodyonly $opt_side_by_side $opt_merge
 	    $opt_igncheck $use_sysfs $use_hexdump $sbs_col_width
-	    @vendors %decode_callback $revision @dimm $current %hexdump_cache);
+	    @vendors %decode_callback @dimm $current %hexdump_cache);
 
 use constant LITTLEENDIAN	=> "little-endian";
 use constant BIGENDIAN		=> "big-endian";
-
-$revision = '$Revision$ ($Date$)';
-$revision =~ s/\$\w+: (.*?) \$/$1/g;
-$revision =~ s/ \([^()]*\)//;
+use constant I2C_TOOLS_VER	=> "4.1";
 
 @vendors = (
 ["AMD", "AMI", "Fairchild", "Fujitsu",
@@ -2637,7 +2634,7 @@ if ($opt_html && !$opt_bodyonly) {
 	      "<body>\n";
 }
 
-printc("decode-dimms version $revision");
+printc("decode-dimms version ".I2C_TOOLS_VER);
 printh('Memory Serial Presence Detect Decoder',
 'By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
 Jean Delvare, Trent Piepho and others');

-- 
Jean Delvare
SUSE L3 Support
