Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D581225C94
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jul 2020 12:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgGTKYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 06:24:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgGTKYS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jul 2020 06:24:18 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 533EE20773;
        Mon, 20 Jul 2020 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595240658;
        bh=W9TTx5jyCQo5ak9o/jP6CEx/Sr341WG69OjAm34Eqek=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=T4tSNOm0gskCRWVggXCfex1g0XU6SADjFV849ioJKi9OoLSDtZHkdljU5S3rFfdJt
         2h7jnhcXhQEuBT1vJUcdFV5HBphLs0LUZr6JqWGQP/R6IoyDMOGl5iMJbbCp5ZNkOf
         ZBoUFpYtFkqrcXdxdq0fXrkDKDG20qXO686m1Khs=
Date:   Mon, 20 Jul 2020 12:24:15 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
cc:     gupt21@gmail.com, benjamin.tissoires@redhat.com,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: Replace HTTP links with HTTPS ones
In-Reply-To: <20200713082135.32350-1-grandmaster@al2klimov.de>
Message-ID: <nycvar.YFH.7.76.2007201224030.23768@cbobk.fhfr.pm>
References: <20200713082135.32350-1-grandmaster@al2klimov.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Applied, thanks Alexander.

-- 
Jiri Kosina
SUSE Labs

