Return-Path: <linux-i2c+bounces-13016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD19FB7DA02
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2AC71890E2A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 11:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB782BE035;
	Wed, 17 Sep 2025 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jaoiklsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHHL6zJj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jaoiklsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHHL6zJj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF242248B0
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107096; cv=none; b=eZA3lYYILNItMSslinIPz7S53VMJUpAB+w3n1+gav0uORxs/3NNGcYDnVo28jDrJITZLblIbvKVDiYbjNJ+QdoBX8FibTS5MzpGzifsEpsyhfwbjErNVhE0axYd9nbq4Up45Fs13HWs87Szo72d20cuay/TFAJKDzKg7FCoAs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107096; c=relaxed/simple;
	bh=I/Xui3GJdCKoC70G6XYbvO0QjOZSmpYDg1Jz/Ga/LHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n4J9KZmdjoQdPyGcjbQnfphCVuZom5ck4RRvW0CXt/1EJv2imqN7Kqec4WIreiyxQWlXATM6ykL4UO8AC2ynbUzLAA6UvFiNMDg8/Z8ilnta9H7li9mLHOZiBThp/35tbblWvpJ+0+DUSyfCf04FVqSyFOSCuGmG6/b9PqvcVQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jaoiklsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHHL6zJj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jaoiklsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHHL6zJj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 21EC721CF7;
	Wed, 17 Sep 2025 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758107093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DO6dSEomhhrdD6ppxfJ9SO8vZjyUqNW5C+D8bIbmds0=;
	b=jaoiklsrfRxF9PxRIvoifLLezekhIEUCiBY18FZ1on1LcNJrxOLUH8zmxVLNAeGvTiZYEU
	h8n0KwTH+fxZM2JKfpnQihUGUJpTebmH/iLyoiecS4xVdGHr9xZ8jn0yhUC/f67M1EWdoY
	QPmXQhdVQ/fpjeicD+tq68XV/XDuAKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758107093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DO6dSEomhhrdD6ppxfJ9SO8vZjyUqNW5C+D8bIbmds0=;
	b=hHHL6zJjqe9mRjpi7cuF7JkTHOKc8bh/hTrV07sQwzF8lUwphDcUESLkED7z5cl0iFb5Mj
	EzCSCfoRBn9QUeAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jaoiklsr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hHHL6zJj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758107093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DO6dSEomhhrdD6ppxfJ9SO8vZjyUqNW5C+D8bIbmds0=;
	b=jaoiklsrfRxF9PxRIvoifLLezekhIEUCiBY18FZ1on1LcNJrxOLUH8zmxVLNAeGvTiZYEU
	h8n0KwTH+fxZM2JKfpnQihUGUJpTebmH/iLyoiecS4xVdGHr9xZ8jn0yhUC/f67M1EWdoY
	QPmXQhdVQ/fpjeicD+tq68XV/XDuAKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758107093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DO6dSEomhhrdD6ppxfJ9SO8vZjyUqNW5C+D8bIbmds0=;
	b=hHHL6zJjqe9mRjpi7cuF7JkTHOKc8bh/hTrV07sQwzF8lUwphDcUESLkED7z5cl0iFb5Mj
	EzCSCfoRBn9QUeAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2C3013A63;
	Wed, 17 Sep 2025 11:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9hgdLdSVymiiQgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 17 Sep 2025 11:04:52 +0000
Date: Wed, 17 Sep 2025 13:04:50 +0200
From: Jean Delvare <jdelvare@suse.de>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros
 <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Recent i2c-designware initialization fix
Message-ID: <20250917130450.50ff0db3@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 21EC721CF7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01

Hello Michael,

I have been looking into your kernel commit 3d30048958e0
("i2c/designware: Fix an initialization issue"), as it received a CVE
number (CVE-2025-38380), I was asked to evaluate the severity of the
bug.

I was not familiar with the i2c-designware driver so it took me some
reading time to form an opinion on the matter. But after a careful
review, my conclusion is that there was no actual bug in the first
place. If I'm correct then CVE-2025-38380 is invalid.

My reasoning is as follows:
* struct dw_i2c_dev is allocated per-PCI device in i2c_dw_pci_probe()
  using devm_kzalloc(), therefore all its members, including
  dev->msg_write_idx, are initialized to 0.
* The supposedly problematic code path is only taken if (dev->flags &
  MODEL_MASK) == MODEL_AMD_NAVI_GPU.
* The only place where dev->msg_write_idx is set to a non-zero value is
  in i2c_dw_xfer_msg(). This function is only called by i2c_dw_isr(),
  which in turn is only called if the device is not in polling mode.
* The flags set for the AMD Navi GPU devices are:
  dev->flags |= MODEL_AMD_NAVI_GPU | ACCESS_POLLING
  so these devices are always in polling mode and never use an
  interrupt so i2c_dw_isr() is never called for them.

If my reasoning is correct, then for the AMD Navi GPU devices,
dev->msg_write_idx is implicitly initialized to 0 at allocation time
and its value is never changed after that, so the explicit
initialization to 0 which has been added in amd_i2c_dw_xfer_quirk() is
a no-op.

What do you think? Am I missing something?

Thanks,
-- 
Jean Delvare
SUSE L3 Support

