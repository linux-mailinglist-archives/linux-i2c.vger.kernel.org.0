Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FF225C7F0
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 19:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgICRR0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 3 Sep 2020 13:17:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:47404 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728353AbgICRRY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 13:17:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id ABB04AC5E;
        Thu,  3 Sep 2020 17:17:23 +0000 (UTC)
Date:   Thu, 3 Sep 2020 19:17:21 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 1/2] i2c: i801: Fix resume bug
Message-ID: <20200903191721.2ba0128a@endymion>
In-Reply-To: <20200901152221.3cea0048@endymion>
References: <20200901152221.3cea0048@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 1 Sep 2020 15:22:21 +0200, Jean Delvare wrote:
> From: Volker Rümelin <vr_qemu@t-online.de>
> 
> On suspend the original host configuration gets restored. The
> resume routine has to undo this, otherwise the SMBus master
> may be left in disabled state or in i2c mode.
> 
> [JD: Rebased on v5.8, moved the write into i801_setup_hstcfg.]
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Oh and by the way this deserves a Cc: stable@, methinks.

-- 
Jean Delvare
SUSE L3 Support
