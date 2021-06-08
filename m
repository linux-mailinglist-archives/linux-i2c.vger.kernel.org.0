Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BA939FAB6
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhFHPbS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:31:18 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:51814 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhFHPbS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:31:18 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 4FBA5219C4;
        Tue,  8 Jun 2021 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LpwTCTTu9kkJoBbA4UbgmL2nBFTnlYhg6LgSVv53tYk=;
        b=wXXXFSfk5WpkNed7yAs0Q+ICBQ5xVZOaFWMflnGRGvxXKo+9mpA3LXwRoynoICDQiAY7q3
        8CFlmPCwUwY9PtaBsI+S8o7AvWUSNjb/iX44Qaga5EnjpmEQX3owTHB6z87mNAoEYmLFlc
        mVp4wTIHWbSwXhBKF1rKOTddm4kaVeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166164;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LpwTCTTu9kkJoBbA4UbgmL2nBFTnlYhg6LgSVv53tYk=;
        b=7At+Ui2N1129bAJFCTtqNLYFLB68k5mpl+RIbrTMiQY9TpjDQWF2RK3Wrjah6RdkKGVk8H
        6F3K3thcIfPi25CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 1E6A6118DD;
        Tue,  8 Jun 2021 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LpwTCTTu9kkJoBbA4UbgmL2nBFTnlYhg6LgSVv53tYk=;
        b=wXXXFSfk5WpkNed7yAs0Q+ICBQ5xVZOaFWMflnGRGvxXKo+9mpA3LXwRoynoICDQiAY7q3
        8CFlmPCwUwY9PtaBsI+S8o7AvWUSNjb/iX44Qaga5EnjpmEQX3owTHB6z87mNAoEYmLFlc
        mVp4wTIHWbSwXhBKF1rKOTddm4kaVeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166164;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LpwTCTTu9kkJoBbA4UbgmL2nBFTnlYhg6LgSVv53tYk=;
        b=7At+Ui2N1129bAJFCTtqNLYFLB68k5mpl+RIbrTMiQY9TpjDQWF2RK3Wrjah6RdkKGVk8H
        6F3K3thcIfPi25CA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id LNaNBdSMv2AlMwAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:29:24 +0000
Date:   Tue, 8 Jun 2021 17:29:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 2/7] i2cget: Document the support of I2C block reads
Message-ID: <20210608172923.0d3f9296@endymion>
In-Reply-To: <20210608172338.0cf520a1@endymion>
References: <20210608172338.0cf520a1@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mention I2C block read support in the i2cget(8) manual page, together
with an example.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cget.8 |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

--- i2c-tools.orig/tools/i2cget.8	2021-06-08 16:49:54.910097286 +0200
+++ i2c-tools/tools/i2cget.8	2021-06-08 16:56:26.416459188 +0200
@@ -1,4 +1,4 @@
-.TH I2CGET 8 "October 2017"
+.TH I2CGET 8 "June 2021"
 .SH "NAME"
 i2cget \- read from I2C/SMBus chip registers
 
@@ -9,7 +9,7 @@ i2cget \- read from I2C/SMBus chip regis
 .RB [ -a ]
 .I i2cbus
 .I chip-address
-.RI [ "data-address " [ mode ]]
+.RI [ "data-address " [ "mode " [ length ]]]
 .br
 .B i2cget
 .B -V
@@ -49,9 +49,11 @@ an integer between 0x00 and 0xFF. If omi
 will be read (if that makes sense for the considered chip).
 .PP
 The \fImode\fR parameter, if specified, is one of the letters \fBb\fP,
-\fBw\fP or \fBc\fP, corresponding to a read byte data, a read word data or a
-write byte/read byte transaction, respectively. A \fBp\fP can also be appended
-to the \fImode\fR parameter to enable PEC. If the \fImode\fR parameter is omitted,
+\fBw\fP, \fBc\fP, or \fBi\fP, corresponding to a read byte data, a read
+word data, a write byte/read byte, or a read I2C block transaction,
+respectively. A \fBp\fP can also be appended to the \fImode\fR parameter to
+enable PEC, except for I2C block transactions. If the \fImode\fR
+parameter is omitted,
 i2cget defaults to a read byte data transaction, unless \fIdata-address\fR is
 also omitted, in which case the default (and only valid) transaction is a
 single read byte.
@@ -112,6 +114,14 @@ concerns raised above still stand, howev
 equivalent, so this is the only way to read data from a large EEPROM if your
 master isn't fully I2C capable. With a fully I2C capable master, you would
 use \fIi2ctransfer\fR to achieve the same in a safe and faster way.
+.PP
+Read the first 8 bytes of an EEPROM device at 7-bit address 0x50
+on bus 4 (i2c-4):
+.nf
+.RS
+# i2cget -y 4 0x50 0x00 i 8
+.RE
+.fi
 
 .SH BUGS
 To report bugs or send fixes, please write to the Linux I2C mailing list

-- 
Jean Delvare
SUSE L3 Support
