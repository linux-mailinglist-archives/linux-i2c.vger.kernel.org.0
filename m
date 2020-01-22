Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA46D145415
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 12:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgAVLtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 06:49:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:48402 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728981AbgAVLtC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 06:49:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 38C5BB131;
        Wed, 22 Jan 2020 11:49:00 +0000 (UTC)
Date:   Wed, 22 Jan 2020 12:48:59 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/26] docs: i2c: smbus-protocol: enable kernel-doc
 function syntax
Message-ID: <20200122124859.52ceac75@endymion>
In-Reply-To: <211da679-154f-15e3-52d3-a24d50c526cf@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-15-luca@lucaceresoli.net>
        <20200120154444.7c1d3863@endymion>
        <211da679-154f-15e3-52d3-a24d50c526cf@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 21 Jan 2020 18:31:23 +0100, Luca Ceresoli wrote:
> By extrapolation I guess you want to review the few remaining patches.
> Correnct? In this case I'd wait for that before sending out v2.

Yes, and I'm just done with it. Sorry it took so long but I was doing
it as a background task as my work schedule allowed.

One last thing you may want to fix: there's one occurrence of "stop
bit" left in Documentation/i2c/writing-clients.rst.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
