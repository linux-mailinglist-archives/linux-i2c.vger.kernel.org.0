Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C61185C92
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Mar 2020 14:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgCONSL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Mar 2020 09:18:11 -0400
Received: from resqmta-ch2-04v.sys.comcast.net ([69.252.207.36]:42038 "EHLO
        resqmta-ch2-04v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728582AbgCONSL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Mar 2020 09:18:11 -0400
X-Greylist: delayed 26273 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Mar 2020 09:18:11 EDT
Received: from resdmta-ch2-02v.sys.comcast.net ([69.252.207.82])
        by resqmta-ch2-04v.sys.comcast.net with ESMTP
        id D8gHjYa5dsAwiD8gHjQScy; Sat, 14 Mar 2020 15:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20180828_2048; t=1584199589;
        bh=FKoauPgW0BgSTbeebVpBvshI3yu9sxLjXuDRDnk98Z0=;
        h=Received:Received:Received:Received:Reply-To:To:From:Subject:
         Message-ID:Date:MIME-Version:Content-Type;
        b=GoBqpa3KspabG9B5pzToAcWORGGdy3M/7N7HASXMEJzINUS3jIQ/nQvJCfxdymRR4
         3nAGb3/uag9PNbY9f3qtkFeP7xHhaNngLW+31A0jMDGpS4pH2a1HLEcj6jyXmcfBvm
         kjxzNd91UeWsaYG85Wt39G8JyaKhYxl5HKbmiAW+6UKSW52CrSXvStV6aBhx4T6gr/
         N/jgOi2I2PzvRQZtjJbL4T1i5FpAahkJGI7mI4iZK6ZgonCGHdp0B9tVYy3ZAuZE8V
         grVwiAjR3a48HJWX3viU0AOygttlQ32Nmj11p7eiurF+V77wIP8sLAFmUnV6o0dVLY
         ugKS06XTHmpOw==
Received: from resqmta-ch2-09v.sys.comcast.net ([69.252.207.41])
        by resqmta-ch2-12v.sys.comcast.net with ESMTP
        id D8OfjJGFNdJNZD8drjiTJ0; Sat, 14 Mar 2020 15:23:59 +0000
Received: from resomta-ch2-07v.sys.comcast.net ([69.252.207.103])
        by resqmta-ch2-09v.sys.comcast.net with ESMTP
        id D8UdjyflidWWZD8csjAS8Y; Sat, 14 Mar 2020 15:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20180828_2048; t=1584199378;
        bh=FKoauPgW0BgSTbeebVpBvshI3yu9sxLjXuDRDnk98Z0=;
        h=Received:Received:Reply-To:To:From:Subject:Message-ID:Date:
         MIME-Version:Content-Type;
        b=pS9CBrlzdAkCu+RMcb+Bdk3hg3zeW9hsz9sLgXxcnRIloOiKnOom6P5EY08nI1rw+
         dwXbA5GAToxmrZ71rWjUOXJCDGChPQV1JLudNJ814viTxmP447sZAiwR/Ptkab9EFy
         TOoOPXxsNDXzevoFmbrLZSFTEapuXhM8s3iSK/5P5k8amRdMbB7Nav8xOB1eI46iLe
         eN+4BuqENpIQzNFr11CnvJKHMfEgzjhzD1uMh9nGEwGn3umwa3w6b9QqD+zdR69Hr0
         45m6WZ2GQ/s6XFnZKhqkXFW8qstQKdL7HmH7dIleNKRzfLmUSVmbAYkwbScfuKAhsb
         93wgR2LlybcVA==
Received: from [IPv6:2001:558:6040:22:2171:426f:b27e:296d]
 ([IPv6:2001:558:6040:22:2171:426f:b27e:296d])
        by resomta-ch2-07v.sys.comcast.net with ESMTPSA
        id D8crjcD6uTpPjD8csjIZ6k; Sat, 14 Mar 2020 15:22:58 +0000
X-Xfinity-VMeta: sc=-100.00;st=legit
Reply-To: james@nurealm.net
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
From:   James Feeney <james@nurealm.net>
Subject: i2c-tools - at24 vs eeprom - decode-dimms fails with the at24 module
Message-ID: <dc5201ea-de3f-f26c-c95e-fca392b521aa@nurealm.net>
Date:   Sat, 14 Mar 2020 09:22:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The log says "kernel: eeprom 3-0050: eeprom driver is deprecated, please use at24 instead", but decode-dimms will only work with the deprecated eeprom driver.  With the at24 module, "Number of SDRAM DIMMs detected and decoded: 0".  With the eeprom module, "Number of SDRAM DIMMs detected and decoded: 6". This is on Arch Linux, with linux 5.5.9.arch1-2, on an old Asus P6T DELUXE V2 with a Core i7.
