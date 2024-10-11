Return-Path: <linux-i2c+bounces-7335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F6999F40
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 10:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8191F25967
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 08:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D75282FB;
	Fri, 11 Oct 2024 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rz9ojxx/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CF5EA1N6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QhxuaHYr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mJoPdDnW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287C1CB301
	for <linux-i2c@vger.kernel.org>; Fri, 11 Oct 2024 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728636322; cv=none; b=TtfeXVwHWqKCgyW4AmK8xvK4fT8nfh77Yr5gchXEhH1LihnH9c+2l4hk5DIv8RUF8dpztnJwY+fL3UcNwt9Oi3q1Mvyu+l7bB/sugQ3IrakOBUFeLTMPuxFrLLoIYF/OlB6iWAPIRW2N5lybYGR5Jfh9dMDvEksGFVE56H7zk2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728636322; c=relaxed/simple;
	bh=x/pI0xykGkHsRLeMZGWlU1gKfP5c4B6C/LSY6UQmxJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TiciYq7CunTyf4NH2p8AapAvKd7esPOGkIQB2fz0jusKlIa2ElECMhGBDYKYVbUB6+W6zGejxqAp4IO55YiNJqv4iGgH50D5AOSgGWY66R7Z2MgHTkqxOrtnnf9M1ou/aKLgMeUM6zRe+7bWazLYmz7gcPPn4+D16jjbTlRxrF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rz9ojxx/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CF5EA1N6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QhxuaHYr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mJoPdDnW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBE5C1FC0D;
	Fri, 11 Oct 2024 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728636313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ncom/uX4AroWeeiq/3U+wxTQq0SGL4x1wdyhtSqdh4Y=;
	b=rz9ojxx/zhL7MPUyDTJCyqJuwvi11GpXExsARs3Axx7zIUWu+UBlOSY5u9doKNg+2oI8mU
	CisrQe1JNQ3n4x8JBOQ39/mkZN5rGzOVPHrOZ/vl3zr5SgchqJbdwtV0bZuJkWAg6jlOAs
	3zChaX1Slu46zdaUWIZMEULzz94VB0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728636313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ncom/uX4AroWeeiq/3U+wxTQq0SGL4x1wdyhtSqdh4Y=;
	b=CF5EA1N6B7L4jQUUOCorHz319xu353qHfUYI13lfMi0USfi0XlRam4rv9EsYJQxglYqnL3
	biy6PGQKj1s9GnBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QhxuaHYr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mJoPdDnW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728636312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ncom/uX4AroWeeiq/3U+wxTQq0SGL4x1wdyhtSqdh4Y=;
	b=QhxuaHYrTtyBhUndofG374iClxtBLISV/coU7mgwwouOXaTB+G/m+CawmX2R3jzZoz9MfC
	7S9vxdbzvWXcKEQXIRMPJSOQYZQ7oWJac/hUrPa99ZreYHth9mp4VWCEbyUcxQGXpiLwsj
	QS0ymhTT0jbjOHaN7aMmh2ZOzfOyFvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728636312;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ncom/uX4AroWeeiq/3U+wxTQq0SGL4x1wdyhtSqdh4Y=;
	b=mJoPdDnWY2gwUYmJfA52A1/rE08Vbgen8zaBDBk7yC3XSe4sLSjyCwlzMRRqohH3UoumFJ
	KdPYsKw5VNRDnDBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2024136E0;
	Fri, 11 Oct 2024 08:45:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H913KZjlCGduIQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 11 Oct 2024 08:45:12 +0000
Date: Fri, 11 Oct 2024 10:45:08 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: i2c-tools 4.4 has been released
Message-ID: <20241011104508.3d0a8a6d@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EBE5C1FC0D
X-Spam-Level: 
X-Spamd-Result: default: False [-4.44 / 50.00];
	BAYES_HAM(-2.93)[99.70%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.44
X-Spam-Flag: NO

Hi all,

A new version of i2c-tools was tagged and released yesterday. You can
download i2c-tools 4.4 at the usual place:
https://www.kernel.org/pub/software/utils/i2c-tools/

It includes over three years worth of fixes and improvements. Changes
are as follows:
  * tools: Use getopt
           Implement and document option -h
  * eeprog: Use force option when data comes from a pipe
  * i2cdetect: Display more functionality bits with option -F
  * i2cdump: Remove support for SMBus block mode
  * i2cget: Document SMBus block mode
  * i2ctransfer: Sort command line options and add to help text
                 Add an option to print binary data
                 Drop redundant variable arg_idx
  * py-smbus: Install in the defined prefix
              Use setuptools instead of distutils

-- 
Jean Delvare
SUSE L3 Support

