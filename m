Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA7128C478
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 00:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbgJLWDN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 18:03:13 -0400
Received: from linux.microsoft.com ([13.77.154.182]:50676 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbgJLWDN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Oct 2020 18:03:13 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id BDDA020B4905; Mon, 12 Oct 2020 15:03:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDDA020B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1602540192;
        bh=Z6k1J1k3EOCYyGbhzmrhdvk4J/Eq/rLCJl2XEaEux1o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QbDpqcXbmE19MAU9feFg/0RhBh0PPhGpAGwjMCBN4ke9V9XV/C5Z3/gRNUkVVwq4M
         GexItT7MoldHDvzL3O2CLTjf4441H8jRtg7DHdZDpE+S9TzD6BGDcgjbnJadTBsLX2
         9HgqHS7K1uNWtJONfXwbwPQDxLL4iQ5WYQeBSe4A=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     rayagonda.kokatanur@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        dphadke@linux.microsoft.com, f.fainelli@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, lori.hikichi@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Subject: [PATCH v1 6/6] i2c: iproc: handle rx fifo full interrupt
Date:   Mon, 12 Oct 2020 15:03:04 -0700
Message-Id: <20201011182254.17776-7-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20201011182254.17776-7-rayagonda.kokatanur@broadcom.com>
References: <20201011182254.17776-7-rayagonda.kokatanur@broadcom.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

On Sun, 11 Oct 2020 23:52:54 +0530, Rayagonda Kokatanur wrote:
> Add code to handle IS_S_RX_FIFO_FULL_SHIFT interrupt to support
> master write request with >= 64 bytes.
> 
> Iproc has a slave rx fifo size of 64 bytes.
> Rx fifo full interrupt (IS_S_RX_FIFO_FULL_SHIFT) will be generated
> when RX fifo becomes full. This can happen if master issues write
> request of more than 64 bytes.
> 

ARM cores run much faster than I2C bus, why would rx fifo go full when
rx interrupt is enabled and bytes are read out by bus driver isr?
Isn't fifo read pointer updated on these byte reads?
Does controller stretch clock when rx fifo is full (e.g. kernel has
crashed, bus driver isn't draining fifo)?

