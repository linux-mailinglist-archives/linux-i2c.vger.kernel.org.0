Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E371A74DE
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 09:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406695AbgDNHfj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 03:35:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:50544 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406685AbgDNHff (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 03:35:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A6A32ADCD;
        Tue, 14 Apr 2020 07:35:33 +0000 (UTC)
Date:   Tue, 14 Apr 2020 09:35:33 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Adam Honse <calcprogrammer1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Detect secondary SMBus controller on AMD AM4
 chipsets
Message-ID: <20200414093533.23eaf644@endymion>
In-Reply-To: <20200410204843.3856-1-calcprogrammer1@gmail.com>
References: <20200410204843.3856-1-calcprogrammer1@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ah, one thing I forgot: subject line should start with "i2c: piix4: "
so that it is clear which driver is affected.

-- 
Jean Delvare
SUSE L3 Support
