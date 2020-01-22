Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821C11457C7
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 15:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAVO0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 09:26:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:49286 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgAVO0M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 09:26:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 571ADBD08;
        Wed, 22 Jan 2020 14:26:10 +0000 (UTC)
Date:   Wed, 22 Jan 2020 15:26:08 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/26] docs: i2c: smbus-protocol: enable kernel-doc
 function syntax
Message-ID: <20200122152608.40f7c90c@endymion>
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
> Good point. For v2 I added a new patch to use "Implemented by" also in
> i2c-protocol.rst.

BTW... I don't know how Wolfram feels about it, but I don't think
documentation changes need to be split to such fine-grained patches.
Chances that someone will want to cherry-pick specific changes are very
low in my opinion, so a large number of patches only means more
paperwork with little to no benefit. Some splitting is certainly nice
to make reviews easier, but only to a certain degree.

-- 
Jean Delvare
SUSE L3 Support
